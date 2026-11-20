
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';
import { SUPABASE_URL, SUPABASE_PUBLIC_KEY } from './config.js';

const supabase = createClient(SUPABASE_URL, SUPABASE_PUBLIC_KEY);

export async function addResponses(vis, truePercent, reportedPercent) {
    if (vis.length !== truePercent.length || vis.length !== reportedPercent.length) {
        throw new Error('All arrays must have the same length.');
    }

    const participantId = crypto.randomUUID().replaceAll('-', '').slice(0, 12);

    const responses = vis.map((v, i) => ({
        participantId,
        trialNum: i,
        vis: v,
        truePercent: truePercent[i],
        reportedPercent: reportedPercent[i]
    }));

    const { data, error } = await supabase
        .from('responses')
        .insert(responses)
        .select();

    if (error) throw error;

    return { participantId, data };
}

export async function getResponses() {
    const { data, error } = await supabase
        .from('responses')
        .select('*')
        .order('participantId')
        .order('trialNum');

    if (error) throw error;

    return data;
}
