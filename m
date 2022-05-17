Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713D852989C
	for <lists+linux-rtc@lfdr.de>; Tue, 17 May 2022 06:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiEQEOz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 May 2022 00:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiEQEOv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 May 2022 00:14:51 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3014248E
        for <linux-rtc@vger.kernel.org>; Mon, 16 May 2022 21:14:50 -0700 (PDT)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 24H4ES0Z092941;
        Tue, 17 May 2022 13:14:29 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Tue, 17 May 2022 13:14:28 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 24H4ES6E092930
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 17 May 2022 13:14:28 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9476681f-44cb-272a-07db-22f258cff29a@I-love.SAKURA.ne.jp>
Date:   Tue, 17 May 2022 13:14:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] rtc: Avoid flush_scheduled_work() usage
Content-Language: en-US
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
References: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
 <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
In-Reply-To: <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Any questions?

On 2022/04/30 19:25, Tetsuo Handa wrote:
> Flushing system-wide workqueues is dangerous and will be forbidden.
> Replace system_wq with local rtc_wq.
> 
> While we are at it, remove unused rtc_dev_exit().
> 
> Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Changes in v2:
>   Remove unused rtc_dev_exit().
> 
> Since rtc_dev_init() is built into vmlinux, there is no point with
> recovery.
> 
> This patch blindly converts schedule_work() into queue_work() within
> drivers/rtc/dev.c, based on an assumption that none of work items
> outside of drivers/rtc/dev.c needs to be handled by rtc_wq.
> Did I convert correctly?
