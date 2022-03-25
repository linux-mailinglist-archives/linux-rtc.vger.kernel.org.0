Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9724A4E716D
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Mar 2022 11:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238064AbiCYKnk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 25 Mar 2022 06:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236476AbiCYKnk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 25 Mar 2022 06:43:40 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1268C627C
        for <linux-rtc@vger.kernel.org>; Fri, 25 Mar 2022 03:42:05 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D0C9200011;
        Fri, 25 Mar 2022 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648204924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n4e369ctjP8HXy0phKaROLOBHgpSIq3FbZyiOodmHBM=;
        b=o3aR3smOaGsvehkQtGKUN9KVMOkP70f085Xv51CYLJ66bGGbmVutzUPJtZwLpKQhRYl7Wr
        MPDDyTpXM7cavA5K5K46CquWxjxkV2lu3L8H++SbK9gRth0cIQ8l/CmFlkJqncc43T05gB
        pAn0Isp4Wghe51YfzBc2nShY5XdX2CL8rOyOx/yJTviXPi/kiR+t9jXZBsgaRAd1s4gNby
        Mrew+WYhwFrXUFEjJEczx1wO8hjELXxqkgz7SrfpCJ9JlKDcO/z9R4JoK5ng7UzD3Cdo4o
        Y3CMmvYVpNG/Udndz0b3GkYnnzP6c68BWgdZAeOy9htUtTSJ7DYXgjfvYx5NbA==
Date:   Fri, 25 Mar 2022 11:42:03 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Loic Poulain <loic.poulain@linaro.org>, a.zummo@towertech.it
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pm8xxx: Attach wake irq to device
Message-ID: <164820472037.149159.1973420055827215626.b4-ty@bootlin.com>
References: <1645025082-6138-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645025082-6138-1-git-send-email-loic.poulain@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 16 Feb 2022 16:24:42 +0100, Loic Poulain wrote:
> Attach the interrupt as a wake-irq to the device, so that:
> - A corresponding wakeup source is created (and reported in e.g
>   /sys/kernel/debug/wakeup_sources).
> - The power subsystem take cares of arming/disarming
>   irq-wake automatically on suspend/resume.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: pm8xxx: Attach wake irq to device
      commit: b5bf5b283d07bd1f4d49657557fb99ec5fbfc588

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
