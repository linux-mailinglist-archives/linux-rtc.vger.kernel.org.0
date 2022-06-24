Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77168559F47
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jun 2022 19:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiFXRPF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jun 2022 13:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbiFXRPC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jun 2022 13:15:02 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2028D63633
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 10:15:00 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 23158200007;
        Fri, 24 Jun 2022 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656090899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l9Qc67/4dr0spWWCdROMAqNR6eYHviRnqjMwXIbKc7I=;
        b=g489//BXWJi4D2cYmq9/lxLH0dza6Lfu6jRsaiGDLncFBNLRJPN1Gx2sHjABUJI9e2FyGj
        pZX53WRIG4jQcZ/1JjgRWMFEaHPKW6PghO0GRFy3SEfkgeqgBCnDRDvNV+77OUOLjnRpct
        5oceuvw4Qwcajd6Jiog9/0GU9ZUFZR2/GYwP1P4G3+GKc5LhP6voPRE7oa7dLF+86pOjes
        XTJ+I6FTaPwIsbUF8KpP8PEHMLzNq3/ndeFfVOQbyrNZy5t5Xjy0Nst87xgRABRTDzmAXe
        EoeM7e7B0CmsoRDyqzVjaqij8QVzowSm62XdrVs0wp+K4Npo5fwRalaq+1vzxg==
Date:   Fri, 24 Jun 2022 19:14:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     penguin-kernel@i-love.sakura.ne.jp, a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] rtc: Replace flush_scheduled_work() with flush_work().
Message-ID: <165609085454.27886.5394799717723778850.b4-ty@bootlin.com>
References: <febf3af2-ba49-fa40-4a25-e67b743cc421@I-love.SAKURA.ne.jp>
 <c96ea697-b4ea-7e34-1a6f-355561fb7e58@I-love.SAKURA.ne.jp>
 <ef8d46a0-bef8-f747-8f13-7ad4ec514cbf@I-love.SAKURA.ne.jp>
 <Yoe/oPW8MFZ02fEn@mail.local>
 <8d3a0f55-d861-ba93-0d25-b1172eaa8343@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3a0f55-d861-ba93-0d25-b1172eaa8343@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jun 2022 19:48:36 +0900, Tetsuo Handa wrote:
> Since "struct rtc_device" is per a device struct, I assume that clear_uie()
> needs to wait for only one work associated with that device. Therefore,
> wait for only that work using flush_work().
> 
> 

Applied, thanks!

[1/1] rtc: Replace flush_scheduled_work() with flush_work().
      commit: ff30b86c76276c2f858744b8bc04b386b4a36c94

Best regards,
-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
