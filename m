Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3849B3B74A1
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Jun 2021 16:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbhF2OuA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Jun 2021 10:50:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40772 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbhF2Otz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Jun 2021 10:49:55 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5F3CB1FD83;
        Tue, 29 Jun 2021 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624978043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZu4oH3jZC3/BqjjJKnfCZAMHACA4WSlfLyh/RpVa70=;
        b=mAIjIgtsBEi2MzTXy3P3Y/hZuRs38rdByypziIbiVWEwWKvEcztjwvPJh2p5rivcWzt46j
        WfBWMmvFxYw1GlFGezQKOKWvJETugG8+gEMA2IvqNR0/+lxS0V+rS8P+wYhutvkQ03lPkH
        svOUWroYsmeXejMbW6i4HmOGb6yh/ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624978043;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZu4oH3jZC3/BqjjJKnfCZAMHACA4WSlfLyh/RpVa70=;
        b=ddIA12N2cVnS1E423QyG8EzYH2+ejK8C754h8S0UsU1WU63PZT+BlL3S1p8guR3XYrxvsP
        oxPi+oYcyoVp++AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 1E32511906;
        Tue, 29 Jun 2021 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624978043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZu4oH3jZC3/BqjjJKnfCZAMHACA4WSlfLyh/RpVa70=;
        b=mAIjIgtsBEi2MzTXy3P3Y/hZuRs38rdByypziIbiVWEwWKvEcztjwvPJh2p5rivcWzt46j
        WfBWMmvFxYw1GlFGezQKOKWvJETugG8+gEMA2IvqNR0/+lxS0V+rS8P+wYhutvkQ03lPkH
        svOUWroYsmeXejMbW6i4HmOGb6yh/ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624978043;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZu4oH3jZC3/BqjjJKnfCZAMHACA4WSlfLyh/RpVa70=;
        b=ddIA12N2cVnS1E423QyG8EzYH2+ejK8C754h8S0UsU1WU63PZT+BlL3S1p8guR3XYrxvsP
        oxPi+oYcyoVp++AA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id ro9aBXsy22BiEQAALh3uQQ
        (envelope-from <ykaukab@suse.de>); Tue, 29 Jun 2021 14:47:23 +0000
Date:   Tue, 29 Jun 2021 16:47:21 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com,
        Bruno Thomsen <bth@kamstrup.com>
Subject: Re: [PATCH v5] rtc: pcf2127: handle timestamp interrupts
Message-ID: <20210629144721.GE81946@suse.de>
References: <20210624152241.4476-1-ykaukab@suse.de>
 <CAH+2xPBSozyY8np=KSZrDn6nwf0__J1yRtkY_O0-SsBMLxb74g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH+2xPBSozyY8np=KSZrDn6nwf0__J1yRtkY_O0-SsBMLxb74g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jun 28, 2021 at 11:18:28AM +0200, Bruno Thomsen wrote:
> Hi Mian,
> 
> I think your approach to use existing timestamp handling when no irq
> is configured is correct. But I have some review comments and in
> the current form it oops (included at the end of patch).
Thank you for the review and testing! I am sorry about the oops.
> 
> /Bruno
> 
> Den tor. 24. jun. 2021 kl. 17.22 skrev Mian Yousaf Kaukab <ykaukab@suse.de>:
> >
> > commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> > added support for timestamp interrupts. However they are not being
> > handled in the irq handler. If a timestamp interrupt occurs it
> > results in kernel disabling the interrupt and displaying the call
> > trace:
> >
> > [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" option)
> > ...
> > [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> > [  121.248971] Disabling IRQ #78
> >
> > Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
> > before clearing TSF1 and TSF2 flags so that it can't be overwritten.
> > Set a flag to mark if the timestamp is valid and only report to sysfs
> > if the flag is set. To mimic the hardware behavior, don’t save
> > another timestamp until the first one has been read by the userspace.
> >
> > However, if the alarm irq is not configured, keep the old way of
> > handling timestamp interrupt in the timestamp0 sysfs calls.
> >
> > Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> > ---
> > *Only compile tested due to lack of hardware availability*
> >
> > history:
> > v5: -Add irq_enabled flag to keep track of alarm irq. Revert
> >      to current way of handling timestamp interrupt in sysfs callsbacks
> >      if alarm irq is not configured
> > v4: -Save timestamp before clearing TSF1 and TSF2 flags
> >     -Rename timstamp_valid flag to ts_valid
> > v3: -Restore call to pcf2127_wdt_active_ping() in timestamp0_store().
> >      It was removed by mistake.
> > v2: -Add a flag to mark the occurrence of timestamp interrupt
> >     -Add Biwen Li in Cc
> >
> >  drivers/rtc/rtc-pcf2127.c | 172 +++++++++++++++++++++++++++-----------
> >  1 file changed, 121 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 48ce1e85deb1..5a7e673349ed 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -94,10 +94,20 @@
> >  #define PCF2127_WD_VAL_MAX             255
> >  #define PCF2127_WD_VAL_DEFAULT         60
> >
> > +/* Mask for currently enabled interrupts */
> > +#define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
> > +#define PCF2127_CTRL2_IRQ_MASK ( \
> > +               PCF2127_BIT_CTRL2_AF | \
> > +               PCF2127_BIT_CTRL2_WDTF | \
> > +               PCF2127_BIT_CTRL2_TSF2)
> > +
> >  struct pcf2127 {
> >         struct rtc_device *rtc;
> >         struct watchdog_device wdd;
> >         struct regmap *regmap;
> > +       time64_t ts;
> > +       bool ts_valid;
> > +       bool irq_enabled;
> >  };
> >
> >  /*
> > @@ -434,23 +444,92 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> >         return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> >  }
> >
> > +static int pcf2127_rtc_ts_read(struct device *dev, time64_t *ts)
> > +{
> > +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > +       struct rtc_time tm;
> > +       int ret;
> > +       unsigned char data[25];
> > +
> > +       ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
> > +                              sizeof(data));
> > +       if (ret) {
> > +               dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
> > +               return ret;
> > +       }
> 
> The above regmap call reads ctrl2 register so you need to call
> pcf2127_wdt_active_ping()
> 
I will add a comment here to make it the responsibility of the caller.
Both callers are already calling pcf2127_wdt_active_ping()
> > +
> > +       dev_dbg(dev,
> > +               "%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, ts_sc=%02x, ts_mn=%02x, ts_hr=%02x, ts_dm=%02x, ts_mo=%02x, ts_yr=%02x\n",
> > +               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2],
> > +               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> > +               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> > +               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> > +               data[PCF2127_REG_TS_YR]);
> > +
> > +       tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> > +       tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> > +       tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> > +       tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> > +       /* TS_MO register (month) value range: 1-12 */
> > +       tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> > +       tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
> > +       if (tm.tm_year < 70)
> > +               tm.tm_year += 100; /* assume we are in 1970...2069 */
> > +
> > +       ret = rtc_valid_tm(&tm);
> > +       if (ret) {
> > +               dev_err(dev, "Invalid timestamp. ret=%d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       *ts = rtc_tm_to_time64(&tm);
> > +       return 0;
> > +};
> > +
> > +static void pcf2127_rtc_ts_snapshot(struct device *dev)
> > +{
> > +       struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       /* Let userspace read the first timestamp */
> > +       if (pcf2127->ts_valid)
> > +               return;
> > +
> > +       ret = pcf2127_rtc_ts_read(dev, &pcf2127->ts);
> > +       if (!ret)
> > +               pcf2127->ts_valid = true;
> > +}
> > +
> >  static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> >  {
> >         struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> > -       unsigned int ctrl2 = 0;
> > +       unsigned int ctrl1, ctrl2;
> >         int ret = 0;
> >
> > +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
> > +       if (ret)
> > +               return IRQ_NONE;
> > +
> >         ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> >         if (ret)
> >                 return IRQ_NONE;
> >
> > -       if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
> > +       if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ_MASK))
> >                 return IRQ_NONE;
> >
> > -       regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> > -                    ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2_WDTF));
> > +       if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
> > +               pcf2127_rtc_ts_snapshot(dev);
> > +
> > +       if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
> > +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
> > +                       ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
> > +
> > +       if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
> > +               regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                       ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
> >
> > -       rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> > +       if (ctrl2 & PCF2127_BIT_CTRL2_AF)
> > +               rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> >
> >         pcf2127_wdt_active_ping(&pcf2127->wdd);
> >
> > @@ -475,18 +554,22 @@ static ssize_t timestamp0_store(struct device *dev,
> >         struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
> >         int ret;
> >
> > -       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> > -                                PCF2127_BIT_CTRL1_TSF1, 0);
> > -       if (ret) {
> > -               dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
> > -               return ret;
> > -       }
> > +       if (pcf2127->irq_enabled) {
> > +               pcf2127->ts_valid = false;
> > +       } else {
> > +               ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> > +                       PCF2127_BIT_CTRL1_TSF1, 0);
> > +               if (ret) {
> > +                       dev_err(dev, "%s: update ctrl1 ret=%d\n", __func__, ret);
> > +                       return ret;
> > +               }
> >
> > -       ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > -                                PCF2127_BIT_CTRL2_TSF2, 0);
> > -       if (ret) {
> > -               dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
> > -               return ret;
> > +               ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > +                       PCF2127_BIT_CTRL2_TSF2, 0);
> > +               if (ret) {
> > +                       dev_err(dev, "%s: update ctrl2 ret=%d\n", __func__, ret);
> > +                       return ret;
> > +               }
> >         }
> >
> >         ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> 
> After the rework of this function this pcf2127_wdt_active_ping() call
> should be moved into the end of the else condition of irq_enabled.
> As it's only needed after reading the ctrl2 register.
> 
Done.
> > @@ -500,50 +583,36 @@ static ssize_t timestamp0_show(struct device *dev,
> >                                struct device_attribute *attr, char *buf)
> >  {
> >         struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
> > -       struct rtc_time tm;
> > +       unsigned int ctrl1, ctrl2;
> >         int ret;
> > -       unsigned char data[25];
> > -
> > -       ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, data,
> > -                              sizeof(data));
> > -       if (ret) {
> > -               dev_err(dev, "%s: read error ret=%d\n", __func__, ret);
> > -               return ret;
> > -       }
> > -
> > -       dev_dbg(dev,
> > -               "%s: raw data is cr1=%02x, cr2=%02x, cr3=%02x, ts_sc=%02x, "
> > -               "ts_mn=%02x, ts_hr=%02x, ts_dm=%02x, ts_mo=%02x, ts_yr=%02x\n",
> > -               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTRL2],
> > -               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> > -               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> > -               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> > -               data[PCF2127_REG_TS_YR]);
> > +       time64_t ts;
> >
> >         ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
> >         if (ret)
> >                 return ret;
> 
> The 3 lines above need to be moved down to the next comment.
> 
> >
> > -       if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
> > -           !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
> > -               return 0;
> > +       if (pcf2127->irq_enabled) {
> > +               if (!pcf2127->ts_valid)
> > +                       return 0;
> > +               ts = pcf2127->ts;
> > +       } else {
> > +               ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
> > +               if (ret)
> > +                       return 0;
> >
> > -       tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> > -       tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> > -       tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> > -       tm.tm_mday = bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> > -       /* TS_MO register (month) value range: 1-12 */
> > -       tm.tm_mon = bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> > -       tm.tm_year = bcd2bin(data[PCF2127_REG_TS_YR]);
> > -       if (tm.tm_year < 70)
> > -               tm.tm_year += 100; /* assume we are in 1970...2069 */
> > +               ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
> > +               if (ret)
> > +                       return 0;
> 
> Insert pcf2127_wdt_active_ping() here.
> 
I will move it after the call to pcf2127_rtc_ts_read().
> > -       ret = rtc_valid_tm(&tm);
> > -       if (ret)
> > -               return ret;
> > +               if (!(ctrl1 & PCF2127_BIT_CTRL1_TSF1) &&
> > +                   !(ctrl2 & PCF2127_BIT_CTRL2_TSF2))
> > +                       return 0;
> >
> > -       return sprintf(buf, "%llu\n",
> > -                      (unsigned long long)rtc_tm_to_time64(&tm));
> > +               ret = pcf2127_rtc_ts_read(dev, &ts);
> > +               if (ret)
> > +                       return 0;
> > +       }
> > +       return sprintf(buf, "%llu\n", (unsigned long long)ts);
> >  };
> >
> >  static DEVICE_ATTR_RW(timestamp0);
> > @@ -594,6 +663,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
> >                         dev_err(dev, "failed to request alarm irq\n");
> >                         return ret;
> >                 }
> > +               pcf2127->irq_enabled = true;
> >         }
> 
> Add an else condition here with:
> pcf2127->irq_enabled = false;
> 
> Otherwise irq_enabled is read before set when running without irq.
> 
No need. pcf2127 is allocated using devm_kzalloc().
> >
> >         if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
> > --
> > 2.26.2
> >

BR,
Yousaf
