Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4021DEFE8
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 21:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgEVTUy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 15:20:54 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:41642 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730918AbgEVTUy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 15:20:54 -0400
Received: by mail-io1-f66.google.com with SMTP id o5so12498144iow.8;
        Fri, 22 May 2020 12:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7QXy8aTnpYj4ZL7eavU1d7UIYAYQxy4JmDn6cV7LhWI=;
        b=mEtXV42qyBjhNsnaU1UxvE7G1gGzrAmXJw2Ok8O5ILDom3s0+oTBnDBcF2M6Knx0Gq
         znYoB4lj3ORQ5iQu5EaU6aXulLQJZz6vdKMDAR0nYUbLpo6bVSQKl+AY5tiMle4JD+rr
         H7jTX9wSzEA4wjIoUdP0RTM0vgnWpy0urXEQn+elz3KaIiAMPXY88hv3sUBAhu3d6/I5
         x29hlgWkSx2zLt2AkPq6nP/GHE68X14z1gSi6D4abccJ5pf1jsOciNp17ZWjBaa1URWI
         Oj+3/g1UBlbCWU3cQUhNSvA9rLb8qEzNkW/pjimHyRWQVclB8SzkfiFT8d7685nYGKlq
         swrg==
X-Gm-Message-State: AOAM533eZvsMQ/p++By3Y/4U5g0s0cW47Zwj5sxyLXlVNgtO/3FM08GT
        +cx1W9npsCoZ7IOnlKcE78PcyhgP
X-Google-Smtp-Source: ABdhPJy9G8HDq1MG+PtjijzcbP0Rf4PMRzTlR1T9vKVItNb892mHM53dTnWl1h6J6PcQ3Rogm5y3nQ==
X-Received: by 2002:a5d:91d2:: with SMTP id k18mr3353534ior.20.1590175252552;
        Fri, 22 May 2020 12:20:52 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id p7sm4000986iob.7.2020.05.22.12.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 12:20:52 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id r2so553364ila.4;
        Fri, 22 May 2020 12:20:51 -0700 (PDT)
X-Received: by 2002:a92:de02:: with SMTP id x2mr15117816ilm.267.1590175251164;
 Fri, 22 May 2020 12:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200520091543.44692-1-biwen.li@oss.nxp.com>
In-Reply-To: <20200520091543.44692-1-biwen.li@oss.nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 22 May 2020 14:20:28 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ0Q1hSi+nOqwz5Ej0K6Nc0+8376aVN6yyJ4OhkyENPDg@mail.gmail.com>
Message-ID: <CADRPPNQ0Q1hSi+nOqwz5Ej0K6Nc0+8376aVN6yyJ4OhkyENPDg@mail.gmail.com>
Subject: Re: [v2 1/2] dts: ppc: t4240rdb: remove interrupts property
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        a.zummo@towertech.it,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        lkml <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 20, 2020 at 4:21 AM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> This removes interrupts property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-linux: select() to /dev/rtc0
>       to wait for clock tick timed out
>
> My case:
>     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
>       then the RTC cannot inform cpu about the alarm interrupt

The commit message need a little bit improvement.  Something like:

Since the interrupt pin for RTC DS1374 is not connected to the CPU on
T4240RDB, remove
the interrupt property from the device tree.

This also fix the following warning for hwclock.util-linux:
  $ hwclock.util-linux
   hwclock.util-linux: select() to /dev/rtc0
   to wait for clock tick timed out

>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  arch/powerpc/boot/dts/fsl/t4240rdb.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> index a56a705d41f7..145896f2eef6 100644
> --- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> @@ -144,7 +144,6 @@
>                         rtc@68 {
>                                 compatible = "dallas,ds1374";
>                                 reg = <0x68>;
> -                               interrupts = <0x1 0x1 0 0>;
>                         };
>                 };
>
> --
> 2.17.1
>
