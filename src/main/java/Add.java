public class Add
{
    int seq_num,level,id, ref_id;
    String name, mem_ass, act_srt_date, act_end_date, pln_srt_date, pln_end_date, hours, stats, planned_hrs, projects, progressbar, stats_date, comments;
    Add(int seq_num, int level, String name, String mem_ass, String act_srt_date, String act_end_date, String pln_srt_date, String pln_end_date, String hours, int id, int ref_id, String stats, String planned_hrs, String projects, String progressbar, String stats_date, String comments)
    {
        this.seq_num=seq_num;
        this.level=level;
        this.id=id;
        this.ref_id=ref_id;
        this.name=name;
        this.mem_ass=mem_ass;
        this.act_srt_date=act_srt_date;
        this.act_end_date=act_end_date;
        this.pln_srt_date=pln_srt_date;
        this.pln_end_date=pln_end_date;
        this.hours=hours;
        this.stats=stats;
        this.planned_hrs=planned_hrs;
        this.projects=projects;
        this.progressbar=progressbar;
        this.stats_date=stats_date;
        this.comments=comments;
    }
}