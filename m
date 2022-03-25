Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2F74E7171
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Mar 2022 11:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbiCYKoK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 25 Mar 2022 06:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236476AbiCYKoI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 25 Mar 2022 06:44:08 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDD1C7488
        for <linux-rtc@vger.kernel.org>; Fri, 25 Mar 2022 03:42:34 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2EB2060002;
        Fri, 25 Mar 2022 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648204953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z4PWrQppJnplwT8s3QOnUmrJamMy1t8sEiRSYyhxh/Q=;
        b=gHpwYWnijx7y7M77c+ORKn+tG0G8ikFL/C/Iu/Ngf1ZzH9ANnsAqXcF/Ufp0KDaW3Tl4Gn
        bVeRTqVWAPlfHHIvR8+y2cLKc/GchO/LmYus5n676CQTdIKAlyZ3aUswxszn45779r2nzr
        hL/zqmdYTqv2K2BmH9x4hPvJq5mxFbuyBTiNeeEO024Qc88prL1vP4KqElzIkGdhcx8Y9i
        hppXbdFNHruS2aHk7zp5VV55l+dPbU3H7DQ5YoVenPVWzqCPxu72/LOS8BZDUXPjS7AM4u
        gDg2f1e1L7r5Uc2mqpmTGlJGWiF+HtGmGRLzL8/jL+GvRGFOX79eB5mR4aWb+g==
Date:   Fri, 25 Mar 2022 11:42:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Loic Poulain <loic.poulain@linaro.org>, a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pm8xxx: Return -ENODEV if set_time disallowed
Message-ID: <164820472038.149159.1214160671242997426.b4-ty@bootlin.com>
References: <1645090578-20734-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645090578-20734-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 17 Feb 2022 10:36:18 +0100, Loic Poulain wrote:
> Having !allow_set_time is equivalent to non-implemented set_time
> function, which is normally represented with -ENODEV error in RTC
> subsystem.
> 
> Today we are returning -EACCES error code, which is not considered
> by RTC clients as a 'non implemented' feature, and which causes NTP
> to retry hw clk sync (update_rtc) indefinitely.
> 
> [...]

Applied, thanks!

[1/1] rtc: pm8xxx: Return -ENODEV if set_time disallowed
      commit: 870c54e1a3e111613cd68e5cc867455dc4765cd6

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
