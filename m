Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5071E518E
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 01:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgE0XD5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 May 2020 19:03:57 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:40318 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0XD4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 May 2020 19:03:56 -0400
Received: by mail-io1-f50.google.com with SMTP id q8so26561867iow.7;
        Wed, 27 May 2020 16:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEuMtD6LgYJonBecnZRafA5xWf0FkDz2r/VmLiB6F4s=;
        b=dFMHw88k4N4yKO0BGZtAvwgZYh6xfDrOVsJyNOR1FX7/S19fuiW7xYD9LI+A0spfmH
         EWopR9VouvS2ixbUpT+phYTEhKolInn2WcXoW1tA0SgCj2UmNQgNb+qX1ri+NT2DzeG5
         R0kcB6SWVufELXlsUCRO/yy6g9pIgUQNDWBOcN4TcL3+FA174fAC//ZfqyVdJZBEZrjC
         2Mn6dGHcGBaZBnS4ohVsCHtaNUeAa/5+7j+Hugho54Y+hI4xXBWy2oxBZ7wMCH+KTMm3
         H+dg15y6KxZJJ5+DRovH3I/AScBvmFSFJLG+0K6rUcZIKFp/df0sX4Jsfh1wf7GlSq2X
         QdjA==
X-Gm-Message-State: AOAM531ESZaIyXDOrTT5g7SFGDAmVOz4ZCTNd/y0lfHsQvTHp1YOwECj
        wFVEjZq7H3DGtK3zUnPWGMrLOLYK
X-Google-Smtp-Source: ABdhPJw2a+9HRaAId6joPiPs/9ec0f/7MdDS4yOhdidTjAseNKKbV+nn3QKDsMicsjF1Tbcq9tz9jw==
X-Received: by 2002:a02:958e:: with SMTP id b14mr248931jai.126.1590620634676;
        Wed, 27 May 2020 16:03:54 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id y15sm2256675ila.13.2020.05.27.16.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 16:03:53 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id a14so25808656ilk.2;
        Wed, 27 May 2020 16:03:53 -0700 (PDT)
X-Received: by 2002:a92:5cc1:: with SMTP id d62mr517275ilg.95.1590620633009;
 Wed, 27 May 2020 16:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200527034228.23793-1-biwen.li@oss.nxp.com> <20200527034228.23793-2-biwen.li@oss.nxp.com>
In-Reply-To: <20200527034228.23793-2-biwen.li@oss.nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 27 May 2020 18:03:24 -0500
X-Gmail-Original-Message-ID: <CADRPPNS9+QM3pPKpXA_QZ7nLGu5WpyfY=GPx7pJFREUS4s=55A@mail.gmail.com>
Message-ID: <CADRPPNS9+QM3pPKpXA_QZ7nLGu5WpyfY=GPx7pJFREUS4s=55A@mail.gmail.com>
Subject: Re: [v3 2/2] dts: ppc: t1024rdb: remove interrupts property
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        a.zummo@towertech.it,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        lkml <linux-kernel@vger.kernel.org>, Biwen Li <biwen.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, May 26, 2020 at 10:52 PM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> Since the interrupt pin for RTC DS1339 is not connected
> to the CPU on T1024RDB, remove the interrupt property
> from the device tree.
>
> This also fix the following warning for hwclock.util-linux:
> $ hwclock.util-linux
> hwclock.util-linux: select() to /dev/rtc0
> to wait for clock tick timed out
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/powerpc/boot/dts/fsl/t1024rdb.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> index 645caff98ed1..605ceec66af3 100644
> --- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
> @@ -161,7 +161,6 @@
>                         rtc@68 {
>                                 compatible = "dallas,ds1339";
>                                 reg = <0x68>;
> -                               interrupts = <0x1 0x1 0 0>;
>                         };
>                 };
>
> --
> 2.17.1
>
