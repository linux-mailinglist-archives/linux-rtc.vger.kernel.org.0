Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A471E5189
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 01:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgE0XDB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 May 2020 19:03:01 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38430 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0XDB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 May 2020 19:03:01 -0400
Received: by mail-il1-f196.google.com with SMTP id q18so4673014ilm.5;
        Wed, 27 May 2020 16:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IY5UsUVweat3Yf12W30ICZIuRx4S2mbmL7ClK7BMyrw=;
        b=J7cDrOivt2j0zcmNs+z/bjiLR4Lp86/1w0fclgQTzKBHiNVoYGOVyzeRtcCQBuyga4
         8YRZrjYMI/IERzkHAeB9ZkySYtj+NIZF7zlK1gBv+8JIKNEMS4FX7caSZ1j5UlcK0Cs4
         E+HsGvoj7JLIpqtwanwelfDuuNStdPKx2tUiq0398plODLiGv4icoAY5w7CLcA3/wJgv
         bt0kevJP82Zt6u8WucpkRI4LmvH/0wV3bZgloV3q6jScDiIjG+IWUm9lj8eD9+jNCGnf
         m75qxHzwRoxEHzYIVEav3L4quMaofliyZO8lynbIBhj7HDdjZBdBRrzZ1y7r493V+Xqd
         Zs+A==
X-Gm-Message-State: AOAM530ywgklvxkxl1WAGPSAXlFQVUBr4X9YQ7NCYTJOJ4tk55Bl4hoW
        d2hFoNWRm9prBFqzJQXuGSVzLVZX
X-Google-Smtp-Source: ABdhPJxy2S4snQ2BTCS83PVr9ySoTiZECKOCqgYlcTd32Ji0zMNdH2YOj1RGz9aC/BuNYPnKZKzy0A==
X-Received: by 2002:a05:6e02:6cd:: with SMTP id p13mr526519ils.188.1590620579642;
        Wed, 27 May 2020 16:02:59 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id e13sm2215588ils.27.2020.05.27.16.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 16:02:58 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id d1so3280302ila.8;
        Wed, 27 May 2020 16:02:58 -0700 (PDT)
X-Received: by 2002:a05:6e02:54b:: with SMTP id i11mr596533ils.50.1590620578431;
 Wed, 27 May 2020 16:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200527034228.23793-1-biwen.li@oss.nxp.com>
In-Reply-To: <20200527034228.23793-1-biwen.li@oss.nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 27 May 2020 18:02:29 -0500
X-Gmail-Original-Message-ID: <CADRPPNRS59MQ47Be5xuzLCBLJ_77UYMRbMtAUQbXjir6d7jykw@mail.gmail.com>
Message-ID: <CADRPPNRS59MQ47Be5xuzLCBLJ_77UYMRbMtAUQbXjir6d7jykw@mail.gmail.com>
Subject: Re: [v3 1/2] dts: ppc: t4240rdb: remove interrupts property
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

On Tue, May 26, 2020 at 10:49 PM Biwen Li <biwen.li@oss.nxp.com> wrote:
>
> From: Biwen Li <biwen.li@nxp.com>
>
> Since the interrupt pin for RTC DS1374 is not connected
> to the CPU on T4240RDB, remove the interrupt property
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
