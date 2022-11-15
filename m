Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8057362A1F1
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 20:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiKOTdz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 14:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKOTdy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 14:33:54 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66A4BC5
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 11:33:51 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DB8172000B;
        Tue, 15 Nov 2022 19:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668540829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cyx1wLPW1tlThGAtXOfW9vM12TPC3FEpY+5/edlk4Y0=;
        b=TV3DTvrnvRDtFU5Ekz6nuwv8jy65G4uJQ2Y86sPWOVwY0UB4L1n7AKIHvdkys6kL+0kc7V
        361Pe6tDP+Cn4O24y8NuwJog5AdNi738vQHLYBNeJMRkauBqY9niYjb3s87v4Nkg2bj4nX
        uVjpYpR4q0Qt+s7TE2QWeiNfZeei9Vm4igWnkWlqepRYvIzqmL7WhEcTC1V6XV8kujwHbT
        F8dHtuvXjq2JuXA7Ih5/fPT69+lbTBpK1NuiwC7LV3gmvB423d3ReKk7uPra74PtzzEBfH
        F2aZKH4b6uE5Ed6S2HKja3OMTlqo9ZBHuVaMIoUG2tQL0Zysj22+Kgwh8ezo4A==
Date:   Tue, 15 Nov 2022 20:33:48 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Shang XiaoJing <shangxiaojing@huawei.com>,
        linux-rtc@vger.kernel.org, yangyingliang@huawei.com,
        a.zummo@towertech.it
Subject: Re: [PATCH] rtc: class: Fix potential memleak in
 devm_rtc_allocate_device()
Message-ID: <166854080502.2301099.16945674276167685670.b4-ty@bootlin.com>
References: <20221110090810.11225-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110090810.11225-1-shangxiaojing@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 10 Nov 2022 17:08:10 +0800, Shang XiaoJing wrote:
> devm_rtc_allocate_device() will alloc a rtc_device first, and then run
> dev_set_name(). If dev_set_name() failed, the rtc_device will memleak.
> Move devm_add_action_or_reset() in front of dev_set_name() to prevent
> memleak.
> 
> unreferenced object 0xffff888110a53000 (size 2048):
>   comm "python3", pid 470, jiffies 4296078308 (age 58.882s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 08 30 a5 10 81 88 ff ff  .........0......
>     08 30 a5 10 81 88 ff ff 00 00 00 00 00 00 00 00  .0..............
>   backtrace:
>     [<000000004aac0364>] kmalloc_trace+0x21/0x110
>     [<000000000ff02202>] devm_rtc_allocate_device+0xd4/0x400
>     [<000000001bdf5639>] devm_rtc_device_register+0x1a/0x80
>     [<00000000351bf81c>] rx4581_probe+0xdd/0x110 [rtc_rx4581]
>     [<00000000f0eba0ae>] spi_probe+0xde/0x130
>     [<00000000bff89ee8>] really_probe+0x175/0x3f0
>     [<00000000128e8d84>] __driver_probe_device+0xe6/0x170
>     [<00000000ee5bf913>] device_driver_attach+0x32/0x80
>     [<00000000f3f28f92>] bind_store+0x10b/0x1a0
>     [<000000009ff812d8>] drv_attr_store+0x49/0x70
>     [<000000008139c323>] sysfs_kf_write+0x8d/0xb0
>     [<00000000b6146e01>] kernfs_fop_write_iter+0x214/0x2d0
>     [<00000000ecbe3895>] vfs_write+0x61a/0x7d0
>     [<00000000aa2196ea>] ksys_write+0xc8/0x190
>     [<0000000046a600f5>] do_syscall_64+0x37/0x90
>     [<00000000541a336f>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> [...]

Applied, thanks!

[1/1] rtc: class: Fix potential memleak in devm_rtc_allocate_device()
      commit: 17c98ae4eb03f369a9050611d8b4a78925c35465

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
