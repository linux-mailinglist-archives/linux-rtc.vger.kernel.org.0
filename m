Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F496241AC
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Nov 2022 12:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbiKJLnR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Nov 2022 06:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKJLnQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Nov 2022 06:43:16 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C4D70194
        for <linux-rtc@vger.kernel.org>; Thu, 10 Nov 2022 03:43:14 -0800 (PST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N7Khf2S4KzmVrh;
        Thu, 10 Nov 2022 19:42:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 19:43:12 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 19:43:12 +0800
Subject: Re: [PATCH] rtc: class: Fix potential memleak in
 devm_rtc_allocate_device()
To:     Shang XiaoJing <shangxiaojing@huawei.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <linux-rtc@vger.kernel.org>,
        <yangyingliang@huawei.com>
References: <20221110090810.11225-1-shangxiaojing@huawei.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <087c6cc2-cb7d-8e00-74d7-071313e997ab@huawei.com>
Date:   Thu, 10 Nov 2022 19:43:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221110090810.11225-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 2022/11/10 17:08, Shang XiaoJing wrote:
> devm_rtc_allocate_device() will alloc a rtc_device first, and then run
> dev_set_name(). If dev_set_name() failed, the rtc_device will memleak.
> Move devm_add_action_or_reset() in front of dev_set_name() to prevent
> memleak.
>
> unreferenced object 0xffff888110a53000 (size 2048):
>    comm "python3", pid 470, jiffies 4296078308 (age 58.882s)
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 08 30 a5 10 81 88 ff ff  .........0......
>      08 30 a5 10 81 88 ff ff 00 00 00 00 00 00 00 00  .0..............
>    backtrace:
>      [<000000004aac0364>] kmalloc_trace+0x21/0x110
>      [<000000000ff02202>] devm_rtc_allocate_device+0xd4/0x400
>      [<000000001bdf5639>] devm_rtc_device_register+0x1a/0x80
>      [<00000000351bf81c>] rx4581_probe+0xdd/0x110 [rtc_rx4581]
>      [<00000000f0eba0ae>] spi_probe+0xde/0x130
>      [<00000000bff89ee8>] really_probe+0x175/0x3f0
>      [<00000000128e8d84>] __driver_probe_device+0xe6/0x170
>      [<00000000ee5bf913>] device_driver_attach+0x32/0x80
>      [<00000000f3f28f92>] bind_store+0x10b/0x1a0
>      [<000000009ff812d8>] drv_attr_store+0x49/0x70
>      [<000000008139c323>] sysfs_kf_write+0x8d/0xb0
>      [<00000000b6146e01>] kernfs_fop_write_iter+0x214/0x2d0
>      [<00000000ecbe3895>] vfs_write+0x61a/0x7d0
>      [<00000000aa2196ea>] ksys_write+0xc8/0x190
>      [<0000000046a600f5>] do_syscall_64+0x37/0x90
>      [<00000000541a336f>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
>
> Fixes: 24d23181e43d ("rtc: class: check return value when calling dev_set_name()")
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>   drivers/rtc/class.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index e48223c00c67..e5b7b48cffac 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -374,11 +374,11 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
>   
>   	rtc->id = id;
>   	rtc->dev.parent = dev;
> -	err = dev_set_name(&rtc->dev, "rtc%d", id);
> +	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
> +	err = dev_set_name(&rtc->dev, "rtc%d", id);
>   	if (err)
>   		return ERR_PTR(err);

Looks good to me.
Reviewed-by: Yang Yingliang <yangyingliang@huawei.com>
>   
