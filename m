Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9236912EC
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Feb 2023 23:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjBIWCk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 Feb 2023 17:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBIWCj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 9 Feb 2023 17:02:39 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4660826AD
        for <linux-rtc@vger.kernel.org>; Thu,  9 Feb 2023 14:02:37 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C00B160002;
        Thu,  9 Feb 2023 22:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675980155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=53joPQa0MLZo0AYcfRrdEEuNzI0IIAAzkNLpzMNf6Hs=;
        b=LS9IGA3+umWptwcngQ9qf9nLxd1Rbv10yO2ys1OZpC0vpeCyxFuAHYdTGL2pcT0Uviiz+0
        h9WLwcS/hlnE2i+3Xf7N0kTSQ5ov24+6k8hEZz9tXhhCliRj0kn3iwRDRq844HkWwLSw0v
        IhcjaVTvWEvXX0fEjgE86VuYFwAQAIyQ1WicbjLwb7aMSoOzM45x5ImXiBZsGMhKxwKOry
        IO0bUOvYkpqBNXCYEgYSBweqFPY3HQnzYw0eNlmtwo8q0SJF8VVxyRsNq9qBuGcF+Gk8wg
        HuN4EULzh8rI0q+EXjtauo57bnwalAvgCChENcLVH13uzySTKvJeahPqV/v8sQ==
Date:   Thu, 9 Feb 2023 23:02:31 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Cc:     kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH RESEND 0/2] rtc: rv8803 patches
Message-ID: <167598012662.1651125.13925674123145941600.b4-ty@bootlin.com>
References: <20221123095527.2771434-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123095527.2771434-1-s.hauer@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Wed, 23 Nov 2022 10:55:25 +0100, Sascha Hauer wrote:
> This series has the remainder of
> https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutronix.de/
> which was partly applied.
> 
> Alexandre,
> 
> Last time this series was send you asked if this series fixes a problem
> we've really seen to which Ahmad answered:
> 
> [...]

Applied, thanks!

[1/2] include/linux/bcd.h: provide bcd_is_valid() helper
      commit: 19409796578c879a41e88ddbdbce50c19457658d
[2/2] rtc: rv8803: invalidate date/time if alarm time is invalid
      commit: e5c594233fcf1a55a439dec103aa815cdbf392a7

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
