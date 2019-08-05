Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017B5818FF
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 14:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfHEMQm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 08:16:42 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:36835 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfHEMQm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 08:16:42 -0400
Received: by mail-yw1-f68.google.com with SMTP id x67so28104366ywd.3;
        Mon, 05 Aug 2019 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2owfBemMNzwqCr4e/gAfcBxKqGNq66XIVWka4Mym5jY=;
        b=SFYNAWN7q1kCrntsfHCd/5Mo7YDYTYh2CllkkT2KzjFhkLSrLeYDlfv+vAb9KgjMDT
         6Hy7ogRclX8fMxZDBB7Nzl/j60f88PQIZRmX1s4Con3eiISSybd+c5P27xZVe/sj9lDF
         UDvhHIwCCPhK5RkD4FtECE33nJHjTcog1BuaHp8idReWx6QSTQoVOlsqmTZ7UVWFJth4
         eHCDCZxgqxPw+XYEeHVLwPngS1W/9RLEeFdar8F0cQ0Ia1l7XSj8fVKhtoJosTrAs2Z6
         IBFxKzkRuPgJHwltbMLr2m5oRk9k+LjUwU+VjWUiLcVnl+KcBaIkHW6Ebp2/xcGPq51K
         FORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=2owfBemMNzwqCr4e/gAfcBxKqGNq66XIVWka4Mym5jY=;
        b=QDOQTV14MO4gTlf2Mi6jzHZiRpbnTGv56g/NBQGC0/8ONpv/JLQYfmpKUoEFkKyxjx
         WMJ6oFEAxIbikNRc/BzOzE6MbifOB0qvzA67wcT+Akv5d2VDfp3M+ObCP6fMXVc1dfB1
         LW7zHKKkSKI6Y0shJVZZ0/jj3SD4fctXomiR/cebji8SAeO6dcpXV6XI1MCnG+qt+A4A
         qC041KVGrpXwAhrhnpolIG+rhU1dXi/3DrW6poq/UPocv6uiKY26GcB+zSHUHmb0r2up
         ygUaYQt89SUMt7GmVUqjxp9xFKis1ShKiwXFYjz3ewiRsJqLlHb5xmO7IE9TB0uhV6+8
         /ijg==
X-Gm-Message-State: APjAAAUl2Yz/WYqRK0I0kkmcMWpdzkW5Hqn7KD2K+c9M9oSOmcl3MJkc
        7T1gM9ySTsyzktIfMm+VBQWrN5nJUMqnUpca33o=
X-Google-Smtp-Source: APXvYqzVBhE1astHQr64QTNViz/dNyr7vRGzOPPbBam+bd9DR6XH/cv/8ANa7WDEPPUmj6ThBXsw0wDLPy2SGFUCyKg=
X-Received: by 2002:a81:79d2:: with SMTP id u201mr86194722ywc.457.1565007400871;
 Mon, 05 Aug 2019 05:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190412120730.473-1-megous@megous.com> <20190412120730.473-3-megous@megous.com>
 <CAGb2v675j-aCLMgPJOzr9yx1XxsUvHRr_K7VnL=p8mSdwpu2jw@mail.gmail.com>
 <20190805104529.z3mex3m2tss7lzlr@core.my.home> <CAGb2v67pcxdxjdRX_HN4133A32eA566DDtUJUKV7pqzxDtOaeg@mail.gmail.com>
 <20190805111037.76vmanzcurffpbdf@core.my.home>
In-Reply-To: <20190805111037.76vmanzcurffpbdf@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 5 Aug 2019 14:16:29 +0200
Message-ID: <CAJiuCcevAHm1_P8USuP1TxCDKH=eJ_CA0SC=sfZP=v03p5y_Yw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 2/3] rtc: sun6i: Add support for H6 RTC
To:     megous@megous.com, Chen-Yu Tsai <wens@csie.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Mon, 5 Aug 2019 at 13:10, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> On Mon, Aug 05, 2019 at 06:54:17PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Aug 5, 2019 at 6:45 PM Ond=C5=99ej Jirman <megous@megous.com> w=
rote:
> > >
[snip]
>
> Interesting. :) I have the BSP I was using saved here:
>
> https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-bsp#=
n649
>
> It's based of 4.9.119
>
> https://megous.com/git/linux/log/?h=3Dh6-4.9-bsp
>
> I don't remember where I found it. But I imported it fairly recently, and
> the code you pointed to looks like an older version that I can found in s=
ome
> beta H6 BSP, that I imported way earlier and is based on 4.9.56:

The last recent that I know is from OrangePi H6 but it's based on 4.9.118.

https://github.com/orangepi-xunlong/OrangePiH6_Linux4_9

Regards,
Cl=C3=A9ment

>
> https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dlinux-h6
> https://megous.com/git/linux/log/?h=3Dlinux-h6
>
> Hmm, archeology. :)
>
> > > For older BSPs, the init sequence looked like this:
> > >
> > > 482         /*
> > > 483          * Step1: select RTC clock source
> > > 484          */
> > > 485         tmp_data =3D sunxi_rtc_read(SUNXI_LOSC_CTRL_REG);
> > > 486         tmp_data &=3D (~REG_CLK32K_AUTO_SWT_EN);
> > > 487         tmp_data |=3D (RTC_SOURCE_EXTERNAL | REG_LOSCCTRL_MAGIC);
> > > 488         tmp_data |=3D (EXT_LOSC_GSM);
> > > 489         sunxi_rtc_write(tmp_data, SUNXI_LOSC_CTRL_REG);
> > > 490
> > >
> > > EXT_LOSC_GSM has values 4 values from low to high, and I guess it con=
figures
> > > gain for the oscillator's amplifier in the feedback loop of the circu=
it.
> > >
> > > So the new code, for some reason changed from single write to sequenc=
e
> > > of individual writes/config steps:
> > >
> > > 1) disable auto-switch and enable auto-switch bypass
> > > 2) select RTC clock source (to LOSC)
> > >   (wait)
> >
> > Maybe it's possible to glitch if these two are combined?
>
> That's what I thought too. Or the programmer thought so, and was just
> programming defensively, and there's no real problem in the practice.
>
> But that specific delay() seems like someone trying to solve a real issue=
. Of
> course there's no knowing if it was on H6 or on some other SoC.
>
> regards,
>         o.
>
> >
> > > 3) configure gain on the LOSC
> > >
> > > regards,
> > >         o.
> > >
> > > > ChenYu
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to linux-sunxi+unsubscribe@googlegroups.com.
> > > To view this discussion on the web, visit https://groups.google.com/d=
/msgid/linux-sunxi/20190805104529.z3mex3m2tss7lzlr%40core.my.home.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msg=
id/linux-sunxi/20190805111037.76vmanzcurffpbdf%40core.my.home.
