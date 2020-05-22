Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8ED1DEFEB
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 21:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730849AbgEVTXH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 May 2020 15:23:07 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38300 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730689AbgEVTXH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 May 2020 15:23:07 -0400
Received: by mail-il1-f194.google.com with SMTP id j2so11773451ilr.5;
        Fri, 22 May 2020 12:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vn57VCqr9h90wdQTLGEGnujFsrIL8E9uyvK19tk59RM=;
        b=m7eYvzYdkmBP1R8OISSGhWL3IVxvT7lSHIQiIy2Cg3MlVNF/bFtNZjRka7prcwN33N
         i1q+CJHiEuEwGHav81y6h34MTFWuUgVGLdwCsl/3j22F6WEzYvXDeaGbyILyGENjp9Cc
         sSxlhDlEFliNJ5kKIom8J8SVhk/y3zBCpHboEGFQm3eIZV/nkUprNWcRNeUMnK4M3a7J
         81AfgmP8T63lJsowiXUgr0kNTn0FnkBxtKMQV/4XReW7+scgzp8boH7/XS+vxQ6EVknm
         c2EYMksbrf5T0nwixPKnZ/f0F0I6o5NTVPruUIKng8A0aiqDfsMQk1PizAztY5knm0jz
         Uguw==
X-Gm-Message-State: AOAM5302QTxAbEe9WA7azn/dor6NBcVrCzLWlVc+JMLNMR1mWTl6qwJk
        h6cWfFhHt4AlP3IY9f9YV3U7lnXW
X-Google-Smtp-Source: ABdhPJx8uXBKSuwNLanBhbxs1erywt+U3GHqsTXNwSuhOBc31fG/GPsyChipjdwhdmlts/Kdd4DKeQ==
X-Received: by 2002:a05:6e02:c7:: with SMTP id r7mr15491683ilq.167.1590175384949;
        Fri, 22 May 2020 12:23:04 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id g4sm4964235ilj.45.2020.05.22.12.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 12:23:04 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id d5so3017345ios.9;
        Fri, 22 May 2020 12:23:04 -0700 (PDT)
X-Received: by 2002:a02:7f42:: with SMTP id r63mr4574513jac.32.1590175384093;
 Fri, 22 May 2020 12:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200520091543.44692-1-biwen.li@oss.nxp.com> <20200520091543.44692-2-biwen.li@oss.nxp.com>
In-Reply-To: <20200520091543.44692-2-biwen.li@oss.nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 22 May 2020 14:22:40 -0500
X-Gmail-Original-Message-ID: <CADRPPNTFfUs=YnsfYadp35SyqN4i7JqSPyF3avo=XSBFaLghPQ@mail.gmail.com>
Message-ID: <CADRPPNTFfUs=YnsfYadp35SyqN4i7JqSPyF3avo=XSBFaLghPQ@mail.gmail.com>
Subject: Re: [v2 2/2] dts: ppc: t1024rdb: remove interrupts property
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
>     - RTC ds1339s INT pin isn't connected to cpus INT pin on T1024RDB,
>       then the RTC cannot inform cpu about alarm interrupt
>
> How to fix it?
>     - remove IRQ line

This style is not the recommended style for commit message.  Please
see my comment for the other patch.

>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
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
