Return-Path: <linux-rtc+bounces-3718-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71327A782D8
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 21:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20D8416B91C
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 19:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E1320E334;
	Tue,  1 Apr 2025 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="BshO9kNN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD71D79B8
	for <linux-rtc@vger.kernel.org>; Tue,  1 Apr 2025 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536428; cv=none; b=QMH0kPA45bvRvCJKs/BpxQsIott5ko6lDrDmVbzSJVUXAgXwg4N+b3ozIs1XDLLeKEFU0Yl03kuxMEYfdd+ym0D7xP6folcQBzSx1apLlSk1pVKeUSuuOiwkuSdlQfMNsI70Tjj69/yLYZ1TwxW37E2MvOj4tEG4RCDt0wlq+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536428; c=relaxed/simple;
	bh=AFVodX8EbBny/tNqjn3OUgSXh9+qJ3uApoYjS0Tl130=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvhuYTiqJ7P5bHEEi9BSVrGfMBGZiR2OVoc3UAIjohQjrH4659MiNu3Y/QbDefN0x1Y0vgkccvoNKa8TkrPCeIpEwIGzio52mOYPXoGx+MvazrTZ/18nITEk0yaFkDJie0BEm7/HAVEdgO79cLTRix4md7y219lJrcgQ1oOfZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=BshO9kNN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5700686f8f.0
        for <linux-rtc@vger.kernel.org>; Tue, 01 Apr 2025 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1743536424; x=1744141224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MaJLwInUwn3lrMQiquiR83RZdiUecjYCdp3TUulJCB8=;
        b=BshO9kNNdXNcYQT4X8pP/ajUpxVntR6wNzoUxtYpimIZoRK1Bw57wF0P7F9lJcXFxR
         lg8Jc76z5Pmg4/qZHuAQ06zaSiE8/cc4sGAb15UlEfPWyEqcdzdtwKFmc1ccDKRJM0qE
         viB0uGSMafmWC9eOYDetlGEBeOScaLCFLfcYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743536424; x=1744141224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaJLwInUwn3lrMQiquiR83RZdiUecjYCdp3TUulJCB8=;
        b=LYh4Lgll60/cIWBCkJ5FhK74BI38YRo2aCeCwl5uQgtLmYshmzsdHJHBq2944NogJp
         Gg1m985nTGV1ln6QCJ2XMvuq27dHKZVKi3h2hooUxp1PrGYLK23T8vTVWEYAprqZWyth
         oZQXN0/7etCXKLPbBLIlYPbW+Yw3hD3PWJLVYOB9jSeTw8s6MEev5g+xy2C+whJilDwS
         zAKu4SHjcFhQN3XuRO1Mc2C6rVwwGQXHHMcE53qnVqSKfFyvLGd22UiX8vdQa+zDZUf5
         h3spi2+xxP6f+tP26N5+mMSNHhTrk1Ch+0XUh8U8zxf0o5mI2op6po6ChjEXnCZ0LqXM
         m6aQ==
X-Gm-Message-State: AOJu0YxyWTCzA+C5K7jW6iDKdJ7vuFQstSX3Nfu3L/zcLgVdSaB3DqaG
	6n58WFercazWyz9Tvf1KjQ/Zb69l7mlEYQpYQAsLFcNKseBVpEQi/gQJcY8EvJRMveC0QYxCjpn
	oKHqtmBenYxVo1bmi4xKeZHKMGK6lLv+fHZldpKnOgwApMuRt
X-Gm-Gg: ASbGncusFPzkALXV06uhk3ijCcG8CHn9RWPmf2O+T/2jcm1KvK2QA90wI+l11bZB2W8
	PP+ELCf9plD1A/xRRk4vX8VUKmdpCCCSaPWHKv7N4n7p/0S81FAeutAAvDQ5CQhdMQVnXmyIhrg
	NJaLBkWjnIz4HUUsI6MEpIj6h4l2hPeJaazlpmOVOJ3zLJaI7HvrCo9y9etVP2
X-Google-Smtp-Source: AGHT+IH1u5WX13/nbQTsppF1qkAbkEbeZToaVRJkPZ9wkO00iz9hkHfssXwmUZdqRh9RzNk8N2tL/Ckx4OZENlLo5pg=
X-Received: by 2002:a5d:64c7:0:b0:391:1388:64b7 with SMTP id
 ffacd0b85a97d-39c1211d68bmr11108466f8f.46.1743536423444; Tue, 01 Apr 2025
 12:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116062641.366679-1-nmydeen@mvista.com> <20250401090454fb0ccf16@mail.local>
In-Reply-To: <20250401090454fb0ccf16@mail.local>
From: Niyas Mydeen <nmydeen@mvista.com>
Date: Wed, 2 Apr 2025 01:10:11 +0530
X-Gm-Features: AQ5f1Joe-2EKLutAyMvPxjvwXEh-dABkhNPP0gVq5SrfUwuWmwFbsfcqCjz9pM4
Message-ID: <CAG3LavJku7+0pj0pLEktenLBGA-pXhRHOs_fE4W_Z2EzjdF0+Q@mail.gmail.com>
Subject: Re: [PATCH] rtc-m41t62: kickstart ocillator upon failure
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cminyard@mvista.com
Content-Type: multipart/mixed; boundary="0000000000002c5cc60631bcb522"

--0000000000002c5cc60631bcb522
Content-Type: multipart/alternative; boundary="0000000000002c5cc50631bcb520"

--0000000000002c5cc50631bcb520
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,
Thanks for your comments, I have incorporated all your suggestions and
attached here the updated version.
Hope it meets your expectations.

On Tue, Apr 1, 2025 at 2:34=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> On 16/01/2025 11:56:41+0530, nmydeen@mvista.com wrote:
> > From: "A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>
> >
> > The ocillator on the m41t62 (and other chips of this type) needs
> > a kickstart upon a failure; the RTC read routine will notice the
> > oscillator failure and fail reads.  This is added in the RTC write
> > routine; this allows the system to know that the time in the RTC
> > is accurate.  This is following the procedure described in section
> > 3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"
> >
> > Signed-off-by: A. Niyas Ahamed Mydeen <nmydeen@mvista.com>
> > Reviewed-by: Corey Minyard <cminyard@mvista.com>
> > ---
> >  drivers/rtc/rtc-m41t80.c | 70 ++++++++++++++++++++++++++++------------
> >  1 file changed, 49 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> > index 1f58ae8b151e..77c21c91bae3 100644
> > --- a/drivers/rtc/rtc-m41t80.c
> > +++ b/drivers/rtc/rtc-m41t80.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/mutex.h>
> >  #include <linux/string.h>
> > +#include <linux/delay.h>
> >  #ifdef CONFIG_RTC_DRV_M41T80_WDT
> >  #include <linux/fs.h>
> >  #include <linux/ioctl.h>
> > @@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev,
> struct rtc_time *tm)
> >               return flags;
> >
> >       if (flags & M41T80_FLAGS_OF) {
> > -             dev_err(&client->dev, "Oscillator failure, data is
> invalid.\n");
> > +             dev_err(&client->dev, "Oscillator failure, time may not b=
e
> accurate, write time to RTC to fix it.\n");
> >               return -EINVAL;
> >       }
> >
> > @@ -227,21 +228,60 @@ static int m41t80_rtc_read_time(struct device
> *dev, struct rtc_time *tm)
> >       return 0;
> >  }
> >
> > -static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm=
)
> > +static int m41t80_rtc_set_time(struct device *dev, struct rtc_time
> *in_tm)
> >  {
> >       struct i2c_client *client =3D to_i2c_client(dev);
> >       struct m41t80_data *clientdata =3D i2c_get_clientdata(client);
> > +     struct rtc_time tm =3D *in_tm;
> >       unsigned char buf[8];
> >       int err, flags;
> > +     time64_t time =3D 0;
> >
> > +     flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> > +     if (flags < 0)
> > +             return flags;
> > +     if (flags & M41T80_FLAGS_OF) {
> > +             /* OF cannot be immediately reset: oscillator has to be
> restarted. */
> > +             dev_warn(&client->dev, "OF bit is still set, kickstarting
> clock.\n");
> > +             err =3D i2c_smbus_write_byte_data(client, M41T80_REG_SEC,
> M41T80_SEC_ST);
> > +             if (err < 0) {
> > +                     dev_err(&client->dev, "Can't set ST bit\n");
>
> This is super verbose, please use dev_dbg or drop the dev_errs. The only
> user action after a failure would be to restart the operation anyway.
>
> > +                     return err;
> > +             }
> > +             err =3D i2c_smbus_write_byte_data(client, M41T80_REG_SEC,
> > +                                                 flags &
> ~M41T80_SEC_ST);
> > +             if (err < 0) {
> > +                     dev_err(&client->dev, "Can't clear ST bit\n");
> > +                     return err;
> > +             }
> > +             /* oscillator must run for 4sec before we attempt to rese=
t
> OF bit */
> > +             msleep(4000);
> > +             /* Clear the OF bit of Flags Register */
> > +             err =3D i2c_smbus_write_byte_data(client, M41T80_REG_FLAG=
S,
> > +                                     flags & ~M41T80_FLAGS_OF);
>
> checkpatch --strict complains about some style issues, please fix those.
>
> > +             if (err < 0) {
> > +                     dev_err(&client->dev, "Unable to write flags
> register\n");
> > +                     return err;
> > +             }
> > +             flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLA=
GS);
> > +             if (flags < 0)
> > +                     return flags;
> > +             else if (flags & M41T80_FLAGS_OF) {
> > +                     dev_err(&client->dev, "Can't clear the OF bit
> check battery\n");
> > +                     return err;
> > +             }
> > +             /* add 4sec of oscillator stablize time otherwise we are
> behind 4sec */
> > +             time =3D rtc_tm_to_time64(&tm);
> > +             rtc_time64_to_tm(time+4, &tm);
> > +     }
>
> The main issue is that now, you have cleared OF so if any read/write to
> the RTC fails, you would return from the function without having set the
> time. So when OF is set, you should first add the 4s, then set the time,
> then kickstart the RTC.
>
> >       buf[M41T80_REG_SSEC] =3D 0;
> > -     buf[M41T80_REG_SEC] =3D bin2bcd(tm->tm_sec);
> > -     buf[M41T80_REG_MIN] =3D bin2bcd(tm->tm_min);
> > -     buf[M41T80_REG_HOUR] =3D bin2bcd(tm->tm_hour);
> > -     buf[M41T80_REG_DAY] =3D bin2bcd(tm->tm_mday);
> > -     buf[M41T80_REG_MON] =3D bin2bcd(tm->tm_mon + 1);
> > -     buf[M41T80_REG_YEAR] =3D bin2bcd(tm->tm_year - 100);
> > -     buf[M41T80_REG_WDAY] =3D tm->tm_wday;
> > +     buf[M41T80_REG_SEC] =3D bin2bcd(tm.tm_sec);
> > +     buf[M41T80_REG_MIN] =3D bin2bcd(tm.tm_min);
> > +     buf[M41T80_REG_HOUR] =3D bin2bcd(tm.tm_hour);
> > +     buf[M41T80_REG_DAY] =3D bin2bcd(tm.tm_mday);
> > +     buf[M41T80_REG_MON] =3D bin2bcd(tm.tm_mon + 1);
> > +     buf[M41T80_REG_YEAR] =3D bin2bcd(tm.tm_year - 100);
> > +     buf[M41T80_REG_WDAY] =3D tm.tm_wday;
> >
> >       /* If the square wave output is controlled in the weekday registe=
r
> */
> >       if (clientdata->features & M41T80_FEATURE_SQ_ALT) {
> > @@ -261,18 +301,6 @@ static int m41t80_rtc_set_time(struct device *dev,
> struct rtc_time *tm)
> >               return err;
> >       }
> >
> > -     /* Clear the OF bit of Flags Register */
> > -     flags =3D i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> > -     if (flags < 0)
> > -             return flags;
> > -
> > -     err =3D i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
> > -                                     flags & ~M41T80_FLAGS_OF);
> > -     if (err < 0) {
> > -             dev_err(&client->dev, "Unable to write flags register\n")=
;
> > -             return err;
> > -     }
> > -
> >       return err;
> >  }
> >
> > --
> > 2.34.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Regards,
A. Mydeen.

--0000000000002c5cc50631bcb520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexandre,</div><div>Thanks for your comments, I h=
ave incorporated all your suggestions and attached here the updated=C2=A0ve=
rsion.</div><div>Hope it meets your expectations.</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Apr 1, 2025 at 2:34=E2=80=AFPM Alexandre Belloni &lt;<a href=3D"m=
ailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
On 16/01/2025 11:56:41+0530, <a href=3D"mailto:nmydeen@mvista.com" target=
=3D"_blank">nmydeen@mvista.com</a> wrote:<br>
&gt; From: &quot;A. Niyas Ahamed Mydeen&quot; &lt;<a href=3D"mailto:nmydeen=
@mvista.com" target=3D"_blank">nmydeen@mvista.com</a>&gt;<br>
&gt; <br>
&gt; The ocillator on the m41t62 (and other chips of this type) needs<br>
&gt; a kickstart upon a failure; the RTC read routine will notice the<br>
&gt; oscillator failure and fail reads.=C2=A0 This is added in the RTC writ=
e<br>
&gt; routine; this allows the system to know that the time in the RTC<br>
&gt; is accurate.=C2=A0 This is following the procedure described in sectio=
n<br>
&gt; 3.11 of=C2=A0 &quot;<a href=3D"https://www.st.com/resource/en/datashee=
t/m41t62.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.st.com/resou=
rce/en/datasheet/m41t62.pdf</a>&quot;<br>
&gt; <br>
&gt; Signed-off-by: A. Niyas Ahamed Mydeen &lt;<a href=3D"mailto:nmydeen@mv=
ista.com" target=3D"_blank">nmydeen@mvista.com</a>&gt;<br>
&gt; Reviewed-by: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" =
target=3D"_blank">cminyard@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/rtc/rtc-m41t80.c | 70 ++++++++++++++++++++++++++++------=
------<br>
&gt;=C2=A0 1 file changed, 49 insertions(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c<br>
&gt; index 1f58ae8b151e..77c21c91bae3 100644<br>
&gt; --- a/drivers/rtc/rtc-m41t80.c<br>
&gt; +++ b/drivers/rtc/rtc-m41t80.c<br>
&gt; @@ -22,6 +22,7 @@<br>
&gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/mutex.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/string.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt;=C2=A0 #ifdef CONFIG_RTC_DRV_M41T80_WDT<br>
&gt;=C2=A0 #include &lt;linux/fs.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/ioctl.h&gt;<br>
&gt; @@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev=
, struct rtc_time *tm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; M41T80_FLAGS_OF) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Oscillator failure, data is invalid.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Oscillator failure, time may not be accurate, write time to R=
TC to fix it.\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; @@ -227,21 +228,60 @@ static int m41t80_rtc_read_time(struct device *d=
ev, struct rtc_time *tm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *t=
m)<br>
&gt; +static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *i=
n_tm)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D to_i2c_client(=
dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct m41t80_data *clientdata =3D i2c_get_c=
lientdata(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rtc_time tm =3D *in_tm;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[8];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0time64_t time =3D 0;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0flags =3D i2c_smbus_read_byte_data(client, M41T80=
_REG_FLAGS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (flags &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (flags &amp; M41T80_FLAGS_OF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* OF cannot be immed=
iately reset: oscillator has to be restarted. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;client-=
&gt;dev, &quot;OF bit is still set, kickstarting clock.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D i2c_smbus_wri=
te_byte_data(client, M41T80_REG_SEC, M41T80_SEC_ST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Can&#39;t set ST bit\n&quot;);<br=
>
<br>
This is super verbose, please use dev_dbg or drop the dev_errs. The only<br=
>
user action after a failure would be to restart the operation anyway.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D i2c_smbus_wri=
te_byte_data(client, M41T80_REG_SEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp; ~M41T80_SEC_ST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Can&#39;t clear ST bit\n&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* oscillator must ru=
n for 4sec before we attempt to reset OF bit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(4000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Clear the OF bit o=
f Flags Register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D i2c_smbus_wri=
te_byte_data(client, M41T80_REG_FLAGS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp; =
~M41T80_FLAGS_OF);<br>
<br>
checkpatch --strict complains about some style issues, please fix those.<br=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Unable to write flags register\n&=
quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags =3D i2c_smbus_r=
ead_byte_data(client, M41T80_REG_FLAGS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (flags &amp; =
M41T80_FLAGS_OF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Can&#39;t clear the OF bit check =
battery\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* add 4sec of oscill=
ator stablize time otherwise we are behind 4sec */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time =3D rtc_tm_to_ti=
me64(&amp;tm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc_time64_to_tm(time=
+4, &amp;tm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
The main issue is that now, you have cleared OF so if any read/write to<br>
the RTC fails, you would return from the function without having set the<br=
>
time. So when OF is set, you should first add the 4s, then set the time,<br=
>
then kickstart the RTC.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_SSEC] =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_SEC] =3D bin2bcd(tm-&gt;tm_sec);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_MIN] =3D bin2bcd(tm-&gt;tm_min);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_HOUR] =3D bin2bcd(tm-&gt;tm_hour);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_DAY] =3D bin2bcd(tm-&gt;tm_mday);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_MON] =3D bin2bcd(tm-&gt;tm_mon + 1=
);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_YEAR] =3D bin2bcd(tm-&gt;tm_year -=
 100);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_WDAY] =3D tm-&gt;tm_wday;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_SEC] =3D bin2bcd(tm.tm_sec);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_MIN] =3D bin2bcd(tm.tm_min);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_HOUR] =3D bin2bcd(tm.tm_hour);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_DAY] =3D bin2bcd(tm.tm_mday);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_MON] =3D bin2bcd(tm.tm_mon + 1);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_YEAR] =3D bin2bcd(tm.tm_year - 100=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[M41T80_REG_WDAY] =3D tm.tm_wday;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the square wave output is controlled i=
n the weekday register */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (clientdata-&gt;features &amp; M41T80_FEA=
TURE_SQ_ALT) {<br>
&gt; @@ -261,18 +301,6 @@ static int m41t80_rtc_set_time(struct device *dev=
, struct rtc_time *tm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Clear the OF bit of Flags Register */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0flags =3D i2c_smbus_read_byte_data(client, M41T80=
_REG_FLAGS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (flags &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0err =3D i2c_smbus_write_byte_data(client, M41T80_=
REG_FLAGS,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp; =
~M41T80_FLAGS_OF);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Unable to write flags register\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Re=
gards,<br>A. Mydeen.<br></div>

--0000000000002c5cc50631bcb520--
--0000000000002c5cc60631bcb522
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-rtc-m41t62-kickstart-ocillator-upon-failure.patch"
Content-Disposition: attachment; 
	filename="0001-rtc-m41t62-kickstart-ocillator-upon-failure.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m8ywjyje0>
X-Attachment-Id: f_m8ywjyje0

RnJvbSBlMWEyOTRiMzBmN2U0OGQwMzQyMDg3MzkyZmY1ODRiNDk1NmZhYTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiQS4gTml5YXMgQWhhbWVkIE15ZGVlbiIgPG5teWRlZW5AbXZp
c3RhLmNvbT4KRGF0ZTogVGh1LCA5IEphbiAyMDI1IDE2OjMzOjAwICswNTMwClN1YmplY3Q6IFtQ
QVRDSF0gcnRjLW00MXQ2Mjoga2lja3N0YXJ0IG9jaWxsYXRvciB1cG9uIGZhaWx1cmUKClRoZSBv
Y2lsbGF0b3Igb24gdGhlIG00MXQ2MiAoYW5kIG90aGVyIGNoaXBzIG9mIHRoaXMgdHlwZSkgbmVl
ZHMKYSBraWNrc3RhcnQgdXBvbiBhIGZhaWx1cmU7IHRoZSBSVEMgcmVhZCByb3V0aW5lIHdpbGwg
bm90aWNlIHRoZQpvc2NpbGxhdG9yIGZhaWx1cmUgYW5kIGZhaWwgcmVhZHMuICBUaGlzIGlzIGFk
ZGVkIGluIHRoZSBSVEMgd3JpdGUKcm91dGluZTsgdGhpcyBhbGxvd3MgdGhlIHN5c3RlbSB0byBr
bm93IHRoYXQgdGhlIHRpbWUgaW4gdGhlIFJUQwppcyBhY2N1cmF0ZS4gIFRoaXMgaXMgZm9sbG93
aW5nIHRoZSBwcm9jZWR1cmUgZGVzY3JpYmVkIGluIHNlY3Rpb24KMy4xMSBvZiAgImh0dHBzOi8v
d3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9kYXRhc2hlZXQvbTQxdDYyLnBkZiIKClNpZ25lZC1vZmYt
Ynk6IEEuIE5peWFzIEFoYW1lZCBNeWRlZW4gPG5teWRlZW5AbXZpc3RhLmNvbT4KUmV2aWV3ZWQt
Ynk6IENvcmV5IE1pbnlhcmQgPGNtaW55YXJkQG12aXN0YS5jb20+ClJldmlld2VkLWJ5OiBBbGV4
YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVy
cy9ydGMvcnRjLW00MXQ4MC5jIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tNDF0ODAuYyBiL2RyaXZlcnMvcnRjL3J0
Yy1tNDF0ODAuYwppbmRleCAxZjU4YWU4YjE1MWUuLjcwNzRkMDg2ZjFjOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLW00MXQ4MC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1tNDF0ODAuYwpA
QCAtMjIsNiArMjIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51
eC9tdXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgorI2luY2x1ZGUgPGxpbnV4L2Rl
bGF5Lmg+CiAjaWZkZWYgQ09ORklHX1JUQ19EUlZfTTQxVDgwX1dEVAogI2luY2x1ZGUgPGxpbnV4
L2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvaW9jdGwuaD4KQEAgLTIwNCw3ICsyMDUsNyBAQCBzdGF0
aWMgaW50IG00MXQ4MF9ydGNfcmVhZF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0
Y190aW1lICp0bSkKIAkJcmV0dXJuIGZsYWdzOwogCiAJaWYgKGZsYWdzICYgTTQxVDgwX0ZMQUdT
X09GKSB7Ci0JCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiT3NjaWxsYXRvciBmYWlsdXJlLCBkYXRh
IGlzIGludmFsaWQuXG4iKTsKKwkJZGV2X2VycigmY2xpZW50LT5kZXYsICJPc2NpbGxhdG9yIGZh
aWx1cmUsIHRpbWUgbWF5IG5vdCBiZSBhY2N1cmF0ZSwgd3JpdGUgdGltZSB0byBSVEMgdG8gZml4
IGl0LlxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIApAQCAtMjI3LDIxICsyMjgsMzEgQEAg
c3RhdGljIGludCBtNDF0ODBfcnRjX3JlYWRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBydGNfdGltZSAqdG0pCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgbTQxdDgwX3J0Y19z
ZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfdGltZSAqdG0pCitzdGF0aWMg
aW50IG00MXQ4MF9ydGNfc2V0X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3Rp
bWUgKmluX3RtKQogewogCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50
KGRldik7CiAJc3RydWN0IG00MXQ4MF9kYXRhICpjbGllbnRkYXRhID0gaTJjX2dldF9jbGllbnRk
YXRhKGNsaWVudCk7CisJc3RydWN0IHJ0Y190aW1lIHRtID0gKmluX3RtOwogCXVuc2lnbmVkIGNo
YXIgYnVmWzhdOwogCWludCBlcnIsIGZsYWdzOworCXRpbWU2NF90IHRpbWUgPSAwOwogCisJZmxh
Z3MgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LCBNNDFUODBfUkVHX0ZMQUdTKTsK
KwlpZiAoZmxhZ3MgPCAwKQorCQlyZXR1cm4gZmxhZ3M7CisJaWYgKGZsYWdzICYgTTQxVDgwX0ZM
QUdTX09GKSB7CisJCS8qIGFkZCA0c2VjIG9mIG9zY2lsbGF0b3Igc3RhYmxpemUgdGltZSBvdGhl
cndpc2Ugd2UgYXJlIGJlaGluZCA0c2VjICovCisJCXRpbWUgPSBydGNfdG1fdG9fdGltZTY0KCZ0
bSk7CisJCXJ0Y190aW1lNjRfdG9fdG0odGltZSArIDQsICZ0bSk7CisJfQogCWJ1ZltNNDFUODBf
UkVHX1NTRUNdID0gMDsKLQlidWZbTTQxVDgwX1JFR19TRUNdID0gYmluMmJjZCh0bS0+dG1fc2Vj
KTsKLQlidWZbTTQxVDgwX1JFR19NSU5dID0gYmluMmJjZCh0bS0+dG1fbWluKTsKLQlidWZbTTQx
VDgwX1JFR19IT1VSXSA9IGJpbjJiY2QodG0tPnRtX2hvdXIpOwotCWJ1ZltNNDFUODBfUkVHX0RB
WV0gPSBiaW4yYmNkKHRtLT50bV9tZGF5KTsKLQlidWZbTTQxVDgwX1JFR19NT05dID0gYmluMmJj
ZCh0bS0+dG1fbW9uICsgMSk7Ci0JYnVmW000MVQ4MF9SRUdfWUVBUl0gPSBiaW4yYmNkKHRtLT50
bV95ZWFyIC0gMTAwKTsKLQlidWZbTTQxVDgwX1JFR19XREFZXSA9IHRtLT50bV93ZGF5OworCWJ1
ZltNNDFUODBfUkVHX1NFQ10gPSBiaW4yYmNkKHRtLnRtX3NlYyk7CisJYnVmW000MVQ4MF9SRUdf
TUlOXSA9IGJpbjJiY2QodG0udG1fbWluKTsKKwlidWZbTTQxVDgwX1JFR19IT1VSXSA9IGJpbjJi
Y2QodG0udG1faG91cik7CisJYnVmW000MVQ4MF9SRUdfREFZXSA9IGJpbjJiY2QodG0udG1fbWRh
eSk7CisJYnVmW000MVQ4MF9SRUdfTU9OXSA9IGJpbjJiY2QodG0udG1fbW9uICsgMSk7CisJYnVm
W000MVQ4MF9SRUdfWUVBUl0gPSBiaW4yYmNkKHRtLnRtX3llYXIgLSAxMDApOworCWJ1ZltNNDFU
ODBfUkVHX1dEQVldID0gdG0udG1fd2RheTsKIAogCS8qIElmIHRoZSBzcXVhcmUgd2F2ZSBvdXRw
dXQgaXMgY29udHJvbGxlZCBpbiB0aGUgd2Vla2RheSByZWdpc3RlciAqLwogCWlmIChjbGllbnRk
YXRhLT5mZWF0dXJlcyAmIE00MVQ4MF9GRUFUVVJFX1NRX0FMVCkgewpAQCAtMjYwLDE3ICsyNzEs
MzQgQEAgc3RhdGljIGludCBtNDF0ODBfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHJ0Y190aW1lICp0bSkKIAkJZGV2X2VycigmY2xpZW50LT5kZXYsICJVbmFibGUgdG8g
d3JpdGUgdG8gZGF0ZSByZWdpc3RlcnNcbiIpOwogCQlyZXR1cm4gZXJyOwogCX0KLQotCS8qIENs
ZWFyIHRoZSBPRiBiaXQgb2YgRmxhZ3MgUmVnaXN0ZXIgKi8KLQlmbGFncyA9IGkyY19zbWJ1c19y
ZWFkX2J5dGVfZGF0YShjbGllbnQsIE00MVQ4MF9SRUdfRkxBR1MpOwotCWlmIChmbGFncyA8IDAp
Ci0JCXJldHVybiBmbGFnczsKLQotCWVyciA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xp
ZW50LCBNNDFUODBfUkVHX0ZMQUdTLAotCQkJCQlmbGFncyAmIH5NNDFUODBfRkxBR1NfT0YpOwot
CWlmIChlcnIgPCAwKSB7Ci0JCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiVW5hYmxlIHRvIHdyaXRl
IGZsYWdzIHJlZ2lzdGVyXG4iKTsKLQkJcmV0dXJuIGVycjsKKwlpZiAoZmxhZ3MgJiBNNDFUODBf
RkxBR1NfT0YpIHsKKwkJLyogT0YgY2Fubm90IGJlIGltbWVkaWF0ZWx5IHJlc2V0OiBvc2NpbGxh
dG9yIGhhcyB0byBiZSByZXN0YXJ0ZWQuICovCisJCWRldl93YXJuKCZjbGllbnQtPmRldiwgIk9G
IGJpdCBpcyBzdGlsbCBzZXQsIGtpY2tzdGFydGluZyBjbG9jay5cbiIpOworCQllcnIgPSBpMmNf
c21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgTTQxVDgwX1JFR19TRUMsIE00MVQ4MF9TRUNf
U1QpOworCQlpZiAoZXJyIDwgMCkgeworCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJDYW4ndCBz
ZXQgU1QgYml0XG4iKTsKKwkJCXJldHVybiBlcnI7CisJCX0KKwkJZXJyID0gaTJjX3NtYnVzX3dy
aXRlX2J5dGVfZGF0YShjbGllbnQsIE00MVQ4MF9SRUdfU0VDLCBmbGFncyAmIH5NNDFUODBfU0VD
X1NUKTsKKwkJaWYgKGVyciA8IDApIHsKKwkJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiQ2FuJ3Qg
Y2xlYXIgU1QgYml0XG4iKTsKKwkJCXJldHVybiBlcnI7CisJCX0KKwkJLyogb3NjaWxsYXRvciBt
dXN0IHJ1biBmb3IgNHNlYyBiZWZvcmUgd2UgYXR0ZW1wdCB0byByZXNldCBPRiBiaXQgKi8KKwkJ
bXNsZWVwKDQwMDApOworCQkvKiBDbGVhciB0aGUgT0YgYml0IG9mIEZsYWdzIFJlZ2lzdGVyICov
CisJCWVyciA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBNNDFUODBfUkVHX0ZM
QUdTLCBmbGFncyAmIH5NNDFUODBfRkxBR1NfT0YpOworCQlpZiAoZXJyIDwgMCkgeworCQkJZGV2
X2VycigmY2xpZW50LT5kZXYsICJVbmFibGUgdG8gd3JpdGUgZmxhZ3MgcmVnaXN0ZXJcbiIpOwor
CQkJcmV0dXJuIGVycjsKKwkJfQorCQlmbGFncyA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShj
bGllbnQsIE00MVQ4MF9SRUdfRkxBR1MpOworCQlpZiAoZmxhZ3MgPCAwKSB7CisJCQlyZXR1cm4g
ZmxhZ3M7CisJCX0gZWxzZSBpZiAoZmxhZ3MgJiBNNDFUODBfRkxBR1NfT0YpIHsKKwkJCWRldl9l
cnIoJmNsaWVudC0+ZGV2LCAiQ2FuJ3QgY2xlYXIgdGhlIE9GIGJpdCBjaGVjayBiYXR0ZXJ5XG4i
KTsKKwkJCXJldHVybiBlcnI7CisJCX0KIAl9CiAKIAlyZXR1cm4gZXJyOwotLSAKMi4zNC4xCgo=
--0000000000002c5cc60631bcb522--

