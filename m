Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F43B2631FE
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Sep 2020 18:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731021AbgIIQd3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Sep 2020 12:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730710AbgIIQci (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Sep 2020 12:32:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB535C0617A9;
        Wed,  9 Sep 2020 06:37:35 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4BmjkP4f7pz9sV5; Wed,  9 Sep 2020 23:37:33 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        a.zummo@towertech.it, mpe@ellerman.id.au, leoyang.li@nxp.com,
        benh@kernel.crashing.org, Biwen Li <biwen.li@oss.nxp.com>
Cc:     devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
In-Reply-To: <20200527034228.23793-1-biwen.li@oss.nxp.com>
References: <20200527034228.23793-1-biwen.li@oss.nxp.com>
Subject: Re: [v3 1/2] dts: ppc: t4240rdb: remove interrupts property
Message-Id: <159965824243.811679.11439322992907877530.b4-ty@ellerman.id.au>
Date:   Wed,  9 Sep 2020 23:37:33 +1000 (AEST)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 27 May 2020 11:42:27 +0800, Biwen Li wrote:
> Since the interrupt pin for RTC DS1374 is not connected
> to the CPU on T4240RDB, remove the interrupt property
> from the device tree.
> 
> This also fix the following warning for hwclock.util-linux:
> $ hwclock.util-linux
> hwclock.util-linux: select() to /dev/rtc0
> to wait for clock tick timed out

Applied to powerpc/next.

[1/2] powerpc/dts/t4240rdb: remove interrupts property
      https://git.kernel.org/powerpc/c/8c7614d648037b0776e0b76cb62911be3b059ea4
[2/2] powerc/dtc/t1024rdb: remove interrupts property
      https://git.kernel.org/powerpc/c/843dc8ee23d1b353fa9cc24da3e52be0111d5931

cheers
