Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D7755A025
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jun 2022 20:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiFXRaI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jun 2022 13:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiFXRaG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jun 2022 13:30:06 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1328E34B9D
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 10:30:03 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4049260006;
        Fri, 24 Jun 2022 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656091801;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1SAYMCv42wUylPRBlsDIijRKQIeWLLR/blakn5qUyQE=;
        b=RnTdBYcDg5km+MSqwBVXI1WLyLyIAqqpVNdsdqwFbonQTLU87uHOybPV9rfq3wMvcPsbMw
        ppprR73vSIp4inRkheprccRaq9wWcWNrFB4GLidCZXDOV+EeNiTgQqteNyutkymEj+JFxa
        ghnhMBe5J8QmupBJ/3/uO1oOiCnOBoEav2fwERlbNleBTV7P+ebwf/78TG0tuATCF//Q43
        Z3ayuAb9KKwCWI1cQeFTDB0fGYGp5UA+/09tQZcLXI7w5aR31vm70Oqg5VHOOmud+morAu
        TML0N05Jv2virt+2PC/JVaNgSGyxSlPps5CsUCq35Qh+kgba+n6FQ169pm/C9Q==
Date:   Fri, 24 Jun 2022 19:29:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     penguin-kernel@i-love.sakura.ne.jp, a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: Remove unused rtc_dev_exit().
Message-ID: <165609177196.29699.12317758665042310304.b4-ty@bootlin.com>
References: <1e2f9a99-435d-e149-7456-dfacd53be85a@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e2f9a99-435d-e149-7456-dfacd53be85a@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 11 Jun 2022 23:38:46 +0900, Tetsuo Handa wrote:
> Commit 270a3bd6bdc21407 ("rtc: make class.c explicitly non-modular")
> removed rtc_dev_exit() call.
> 
> 

Applied, thanks!

[1/1] rtc: Remove unused rtc_dev_exit().
      commit: 377e781eea94f8770b35c30664bc4d1751bc0645

Best regards,
-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
