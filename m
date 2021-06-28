Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7963B5B81
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jun 2021 11:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbhF1Jor (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Jun 2021 05:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhF1Jor (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Jun 2021 05:44:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24874C061574;
        Mon, 28 Jun 2021 02:42:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t3so3382518edt.12;
        Mon, 28 Jun 2021 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aKpZUZ3Il+EkxxTYKqjOavZjEwTgvsEjBr8cGngdExo=;
        b=IOWqSdxIMpQ5aH56oond80znedwdAXU2u7kMZhz2O/MxD0VjW3OkO1Ox9PT6rf35gP
         Fpggr2CNLlBX9zhOLn3BW3M0l5xkGCRLoD9sPh32pVnyHpVGxn3Xi0C1grOMqkMYcrEd
         UnYXCRHkhd3CrMWfrLpAK7lTilXp7bctZ3SNwWXCV8xSIfow8e4IhhPrTUwAexCPCVUY
         dPTWv6UjUtSrB2X7967m7HNPK9XRJkN3UxSouh5iEVyv4VPw0gaM7HMhnd8469OZcawZ
         L7vlSGZzjV8G8RcDEcPtxEdcH//3mUYk0CRq/CAoa/xwVV5DNJ3+qhplA0XYMENm8SDK
         8dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aKpZUZ3Il+EkxxTYKqjOavZjEwTgvsEjBr8cGngdExo=;
        b=QtFuMYEE78uhDCDMCQo500/Gbd66fAwTa9KBAPfxUYEaSvKufVBpYqk92XKFzmRUpQ
         oYpfOzo+BchWCruolpuhTweBl3ZWR7nze7/tA8lPeGSIU/rlURmzJ3FhBhamm5CrP5xK
         UtukWnxHjhPXuseBC4Cb4zgHecNqTS0dARaoeVwCoj3Ml1lrp5MsPAaPJTBpdYPIl9QG
         r86FWFGEYgTb7okzLsnQpTkl5rWWr0a4H/0av1RbqOzCOldtkhEJO3dkZTNNtH3EHCkb
         yy+T3ZoaJAB1i4DuqbLoPQ9QlzbzCEdLb7K5SpmYgJiQMUSGZOdoOvkwpSLZ4kJE3nfL
         yciw==
X-Gm-Message-State: AOAM532C1TFq8jI0ZX3f2VB81fZMpHA1gmdEQ0FtuyIpo08+fl/BpBk1
        t6gcD3OhKqG2Z0PO3sbkZj2KRDljD4KiGPoNla4=
X-Google-Smtp-Source: ABdhPJyGnYhyrW3iDSMQCNMfKfgTwihL1+vudeREgVtDdVqn9URaq5cb1RihBC1XvUWbcAiMECGUQxsfLrD6KNxlR9w=
X-Received: by 2002:aa7:c588:: with SMTP id g8mr31730364edq.207.1624873339671;
 Mon, 28 Jun 2021 02:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210624152241.4476-1-ykaukab@suse.de> <CAH+2xPBSozyY8np=KSZrDn6nwf0__J1yRtkY_O0-SsBMLxb74g@mail.gmail.com>
In-Reply-To: <CAH+2xPBSozyY8np=KSZrDn6nwf0__J1yRtkY_O0-SsBMLxb74g@mail.gmail.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Mon, 28 Jun 2021 11:42:03 +0200
Message-ID: <CAH+2xPA+0pej3WrUmyDnCyrWy1TjN3fHrk+L4GW+JAwyEbF5XA@mail.gmail.com>
Subject: Re: [PATCH v5] rtc: pcf2127: handle timestamp interrupts
To:     Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com,
        Bruno Thomsen <bth@kamstrup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den man. 28. jun. 2021 kl. 11.18 skrev Bruno Thomsen <bruno.thomsen@gmail.c=
om>:
>
> Hi Mian,
>
> I think your approach to use existing timestamp handling when no irq
> is configured is correct. But I have some review comments and in
> the current form it oops (included at the end of patch).
>
> /Bruno
>
> Den tor. 24. jun. 2021 kl. 17.22 skrev Mian Yousaf Kaukab <ykaukab@suse.d=
e>:
> >
> > commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> > added support for timestamp interrupts. However they are not being
> > handled in the irq handler. If a timestamp interrupt occurs it
> > results in kernel disabling the interrupt and displaying the call
> > trace:
> >
> > [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" opt=
ion)
> > ...
> > [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threade=
d [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> > [  121.248971] Disabling IRQ #78
> >
> > Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
> > before clearing TSF1 and TSF2 flags so that it can't be overwritten.
> > Set a flag to mark if the timestamp is valid and only report to sysfs
> > if the flag is set. To mimic the hardware behavior, don=E2=80=99t save
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
> > @@ -434,23 +444,92 @@ static int pcf2127_rtc_set_alarm(struct device *d=
ev, struct rtc_wkalrm *alrm)
> >         return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
> >  }
> >
> > +static int pcf2127_rtc_ts_read(struct device *dev, time64_t *ts)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);

Hi again,

Forgot another important comment. After you moved code to
pcf2127_rtc_ts_read() it seems to lookup pcf2127 struct wrong.

struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);

/Bruno

> > +       struct rtc_time tm;
> > +       int ret;
> > +       unsigned char data[25];
> > +
> > +       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, da=
ta,
> > +                              sizeof(data));
> > +       if (ret) {
> > +               dev_err(dev, "%s: read error ret=3D%d\n", __func__, ret=
);
> > +               return ret;
> > +       }
>
> The above regmap call reads ctrl2 register so you need to call
> pcf2127_wdt_active_ping()
>
> > +
> > +       dev_dbg(dev,
> > +               "%s: raw data is cr1=3D%02x, cr2=3D%02x, cr3=3D%02x, ts=
_sc=3D%02x, ts_mn=3D%02x, ts_hr=3D%02x, ts_dm=3D%02x, ts_mo=3D%02x, ts_yr=
=3D%02x\n",
> > +               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTR=
L2],
> > +               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> > +               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> > +               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> > +               data[PCF2127_REG_TS_YR]);
> > +
> > +       tm.tm_sec =3D bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> > +       tm.tm_min =3D bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> > +       tm.tm_hour =3D bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> > +       tm.tm_mday =3D bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> > +       /* TS_MO register (month) value range: 1-12 */
> > +       tm.tm_mon =3D bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> > +       tm.tm_year =3D bcd2bin(data[PCF2127_REG_TS_YR]);
> > +       if (tm.tm_year < 70)
> > +               tm.tm_year +=3D 100; /* assume we are in 1970...2069 */
> > +
> > +       ret =3D rtc_valid_tm(&tm);
> > +       if (ret) {
> > +               dev_err(dev, "Invalid timestamp. ret=3D%d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       *ts =3D rtc_tm_to_time64(&tm);
> > +       return 0;
> > +};
> > +
> > +static void pcf2127_rtc_ts_snapshot(struct device *dev)
> > +{
> > +       struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > +       int ret;
> > +
> > +       /* Let userspace read the first timestamp */
> > +       if (pcf2127->ts_valid)
> > +               return;
> > +
> > +       ret =3D pcf2127_rtc_ts_read(dev, &pcf2127->ts);
> > +       if (!ret)
> > +               pcf2127->ts_valid =3D true;
> > +}
> > +
> >  static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
> >  {
> >         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev);
> > -       unsigned int ctrl2 =3D 0;
> > +       unsigned int ctrl1, ctrl2;
> >         int ret =3D 0;
> >
> > +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1)=
;
> > +       if (ret)
> > +               return IRQ_NONE;
> > +
> >         ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2)=
;
> >         if (ret)
> >                 return IRQ_NONE;
> >
> > -       if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
> > +       if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_I=
RQ_MASK))
> >                 return IRQ_NONE;
> >
> > -       regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> > -                    ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2=
_WDTF));
> > +       if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2=
_TSF2)
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
> > @@ -475,18 +554,22 @@ static ssize_t timestamp0_store(struct device *de=
v,
> >         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);
> >         int ret;
> >
> > -       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
> > -                                PCF2127_BIT_CTRL1_TSF1, 0);
> > -       if (ret) {
> > -               dev_err(dev, "%s: update ctrl1 ret=3D%d\n", __func__, r=
et);
> > -               return ret;
> > -       }
> > +       if (pcf2127->irq_enabled) {
> > +               pcf2127->ts_valid =3D false;
> > +       } else {
> > +               ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG=
_CTRL1,
> > +                       PCF2127_BIT_CTRL1_TSF1, 0);
> > +               if (ret) {
> > +                       dev_err(dev, "%s: update ctrl1 ret=3D%d\n", __f=
unc__, ret);
> > +                       return ret;
> > +               }
> >
> > -       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL2,
> > -                                PCF2127_BIT_CTRL2_TSF2, 0);
> > -       if (ret) {
> > -               dev_err(dev, "%s: update ctrl2 ret=3D%d\n", __func__, r=
et);
> > -               return ret;
> > +               ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG=
_CTRL2,
> > +                       PCF2127_BIT_CTRL2_TSF2, 0);
> > +               if (ret) {
> > +                       dev_err(dev, "%s: update ctrl2 ret=3D%d\n", __f=
unc__, ret);
> > +                       return ret;
> > +               }
> >         }
> >
> >         ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
>
> After the rework of this function this pcf2127_wdt_active_ping() call
> should be moved into the end of the else condition of irq_enabled.
> As it's only needed after reading the ctrl2 register.
>
> > @@ -500,50 +583,36 @@ static ssize_t timestamp0_show(struct device *dev=
,
> >                                struct device_attribute *attr, char *buf=
)
> >  {
> >         struct pcf2127 *pcf2127 =3D dev_get_drvdata(dev->parent);
> > -       struct rtc_time tm;
> > +       unsigned int ctrl1, ctrl2;
> >         int ret;
> > -       unsigned char data[25];
> > -
> > -       ret =3D regmap_bulk_read(pcf2127->regmap, PCF2127_REG_CTRL1, da=
ta,
> > -                              sizeof(data));
> > -       if (ret) {
> > -               dev_err(dev, "%s: read error ret=3D%d\n", __func__, ret=
);
> > -               return ret;
> > -       }
> > -
> > -       dev_dbg(dev,
> > -               "%s: raw data is cr1=3D%02x, cr2=3D%02x, cr3=3D%02x, ts=
_sc=3D%02x, "
> > -               "ts_mn=3D%02x, ts_hr=3D%02x, ts_dm=3D%02x, ts_mo=3D%02x=
, ts_yr=3D%02x\n",
> > -               __func__, data[PCF2127_REG_CTRL1], data[PCF2127_REG_CTR=
L2],
> > -               data[PCF2127_REG_CTRL3], data[PCF2127_REG_TS_SC],
> > -               data[PCF2127_REG_TS_MN], data[PCF2127_REG_TS_HR],
> > -               data[PCF2127_REG_TS_DM], data[PCF2127_REG_TS_MO],
> > -               data[PCF2127_REG_TS_YR]);
> > +       time64_t ts;
> >
> >         ret =3D pcf2127_wdt_active_ping(&pcf2127->wdd);
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
> > +               ts =3D pcf2127->ts;
> > +       } else {
> > +               ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1,=
 &ctrl1);
> > +               if (ret)
> > +                       return 0;
> >
> > -       tm.tm_sec =3D bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
> > -       tm.tm_min =3D bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
> > -       tm.tm_hour =3D bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> > -       tm.tm_mday =3D bcd2bin(data[PCF2127_REG_TS_DM] & 0x3F);
> > -       /* TS_MO register (month) value range: 1-12 */
> > -       tm.tm_mon =3D bcd2bin(data[PCF2127_REG_TS_MO] & 0x1F) - 1;
> > -       tm.tm_year =3D bcd2bin(data[PCF2127_REG_TS_YR]);
> > -       if (tm.tm_year < 70)
> > -               tm.tm_year +=3D 100; /* assume we are in 1970...2069 */
> > +               ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2,=
 &ctrl2);
> > +               if (ret)
> > +                       return 0;
>
> Insert pcf2127_wdt_active_ping() here.
>
> > -       ret =3D rtc_valid_tm(&tm);
> > -       if (ret)
> > -               return ret;
> > +               if (!(ctrl1 & PCF2127_BIT_CTRL1_TSF1) &&
> > +                   !(ctrl2 & PCF2127_BIT_CTRL2_TSF2))
> > +                       return 0;
> >
> > -       return sprintf(buf, "%llu\n",
> > -                      (unsigned long long)rtc_tm_to_time64(&tm));
> > +               ret =3D pcf2127_rtc_ts_read(dev, &ts);
> > +               if (ret)
> > +                       return 0;
> > +       }
> > +       return sprintf(buf, "%llu\n", (unsigned long long)ts);
> >  };
> >
> >  static DEVICE_ATTR_RW(timestamp0);
> > @@ -594,6 +663,7 @@ static int pcf2127_probe(struct device *dev, struct=
 regmap *regmap,
> >                         dev_err(dev, "failed to request alarm irq\n");
> >                         return ret;
> >                 }
> > +               pcf2127->irq_enabled =3D true;
> >         }
>
> Add an else condition here with:
> pcf2127->irq_enabled =3D false;
>
> Otherwise irq_enabled is read before set when running without irq.
>
> >
> >         if (alarm_irq > 0 || device_property_read_bool(dev, "wakeup-sou=
rce")) {
> > --
> > 2.26.2
> >
>
>
> kernel: 8<--- cut here ---
> kernel: Unable to handle kernel NULL pointer dereference at virtual
> address 00000064
> kernel: pgd =3D eced1fcc
> kernel: [00000064] *pgd=3D00000000
> kernel: Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> kernel: Modules linked in: xt_TCPMSS xt_tcpmss xt_hl nf_log_ipv6
> nf_log_ipv4 nf_log_common xt_policy xt_limit xt_conntrack xt_tcpudp
> xt_pkttype ppp_async crc_ccitt ppp_generic slhc ip6table_mangle
> iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> iptable_mangle ip6table_filter ip6_tables iptable_filter ip_tables
> des_generic md5 sch_fq_codel cdc_mbim cdc_wdm cdc_ncm cdc_ether usbnet
> mii cdc_acm usb_storage ip_tunnel xfrm_user xfrm6_tunnel tunnel6
> xfrm4_tunnel tunnel4 esp6 esp4 ah6 ah4 xfrm_algo xt_LOG xt_LED
> xt_comment x_tables ipv6
> kernel: CPU: 0 PID: 1646 Comm: cat Tainted: G                T 5.11.0 #1
> kernel: Hardware name: Freescale i.MX7 Dual (Device Tree)
> kernel: PC is at pcf2127_rtc_ts_read+0x20/0x1a8
> kernel: LR is at timestamp0_show+0xe8/0xfc
> kernel: pc : [<805c756c>]    lr : [<805c7e24>]    psr: 200f0013
> kernel: sp : 890c5cd0  ip : 8913b1c0  fp : 84fab790
> kernel: r10: 890c5e08  r9 : 89403580  r8 : 84a1c000
> kernel: r7 : 890c5d70  r6 : 84a1c000  r5 : 890c4000  r4 : 890c4000
> kernel: r3 : 890c5cd0  r2 : 00000000  r1 : 890c5d70  r0 : 84a1c000
> kernel: Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> kernel: Control: 10c5387d  Table: 85d8806a  DAC: 00000051
> kernel: Process cat (pid: 1646, stack limit =3D 0x53e61d15)
> kernel: Stack: (0x890c5cd0 to 0x890c6000)
> kernel: 5cc0:                                     80541cfc 80548ee8
> 84924400 00000001
> kernel: 5ce0: 84342101 00000000 89403580 890c5e08 84fab790 805447ac
> 00000001 00000011
> kernel: 5d00: bf843c40 00000001 84924400 00000001 84342101 890c5d6c
> 84a1c000 80544864
> kernel: 5d20: 00000000 805445c4 00000000 84924400 00000001 84924400
> 890c5d6c 805437d8
> kernel: 5d40: 84924400 890c4000 847aebc0 84a1c000 89389000 84a1c000
> 89403580 890c5e08
> kernel: 5d60: 84fab790 805c7e24 00000010 00000004 00020000 80285308
> 00003004 e9a70425
> kernel: 5d80: 891bca00 84fab778 80cf5dd4 8083de84 89389000 80528934
> 84fab778 00001000
> kernel: 5da0: 8083de84 8032224c 84fab778 00000000 890c5e20 890c5e88
> 00400cc0 00000001
> kernel: 5dc0: 890c5e08 802b9cd8 00000000 84fab7a0 00000000 ffffa61c
> 00000018 88d7b800
> kernel: 5de0: 00020000 85841b80 00000000 890c4000 890c5e88 00000000
> 00000000 00000000
> kernel: 5e00: 00000000 802c37f0 00000020 00000000 00010000 89403880
> 00000000 00000000
> kernel: 5e20: 85841b80 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> kernel: 5e40: 00000000 00000000 00000000 e9a70425 89403880 890c5ec0
> 01000000 00000000
> kernel: 5e60: 85841b80 00000000 00000000 802c3eac 00000000 00000000
> 00000000 802c43c4
> kernel: 5e80: 00000000 890c4000 00000000 00000000 854f41ed e9a70425
> 854fa140 890c4000
> kernel: 5ea0: 890c5f28 00000000 00000000 85841b80 85841b80 85c4da40
> 00000001 802c4120
> kernel: 5ec0: 01000000 01000000 00000000 85c4da40 00000000 00000000
> 890c5f30 00000000
> kernel: 5ee0: 00000000 00000000 890c4000 e9a70425 85841b80 890c4000
> 7fffffff 00000000
> kernel: 5f00: 01000000 8028fb60 01000000 00000000 01000000 00000000
> 00000000 85c4da40
> kernel: 5f20: 866a9bb0 869383b8 00000000 00000000 00000000 00000000
> 00000003 e9a70425
> kernel: 5f40: 00000000 00000000 890c4000 00000000 00000000 80100264
> 890c4000 000000ef
> kernel: 5f60: 7e8c2884 80291000 7fffffff 00000000 ffffe000 00000001
> 000000ef e9a70425
> kernel: 5f80: 890c4000 01000000 00000000 00000001 000000ef 80100264
> 890c4000 000000ef
> kernel: 5fa0: 7e8c2884 80100240 01000000 00000000 00000001 00000003
> 00000000 01000000
> kernel: 5fc0: 01000000 00000000 00000001 000000ef 01000000 00000001
> 00000000 7e8c2884
> kernel: 5fe0: 0341fa5c 7e8c286c 0339da2f 6f0a23b8 600f0030 00000001
> 00000000 00000000
> kernel: [<805c756c>] (pcf2127_rtc_ts_read) from [<805c7e24>]
> (timestamp0_show+0xe8/0xfc)
> kernel: [<805c7e24>] (timestamp0_show) from [<80528934>]
> (dev_attr_show+0x18/0x48)
> kernel: [<80528934>] (dev_attr_show) from [<8032224c>]
> (sysfs_kf_seq_show+0x7c/0xec)
> kernel: [<8032224c>] (sysfs_kf_seq_show) from [<802b9cd8>]
> (seq_read_iter+0x1a0/0x4f4)
> kernel: [<802b9cd8>] (seq_read_iter) from [<802c37f0>]
> (generic_file_splice_read+0xe8/0x174)
> kernel: [<802c37f0>] (generic_file_splice_read) from [<802c3eac>]
> (splice_direct_to_actor+0xdc/0x2ac)
> kernel: [<802c3eac>] (splice_direct_to_actor) from [<802c4120>]
> (do_splice_direct+0xa4/0xdc)
> kernel: [<802c4120>] (do_splice_direct) from [<8028fb60>]
> (do_sendfile+0x1a4/0x518)
> kernel: [<8028fb60>] (do_sendfile) from [<80291000>]
> (sys_sendfile64+0x11c/0x130)
> kernel: [<80291000>] (sys_sendfile64) from [<80100240>]
> (__sys_trace_return+0x0/0x20)
> kernel: Exception stack(0x890c5fa8 to 0x890c5ff0)
> kernel: 5fa0:                   01000000 00000000 00000001 00000003
> 00000000 01000000
> kernel: 5fc0: 01000000 00000000 00000001 000000ef 01000000 00000001
> 00000000 7e8c2884
> kernel: 5fe0: 0341fa5c 7e8c286c 0339da2f 6f0a23b8
> kernel: Code: e3c35d7f e1a07001 e3c5503f e1a06000 (e5920064)
> kernel: ---[ end trace 3ce50ebdda88528f ]---
