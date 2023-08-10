Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520F477716C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Aug 2023 09:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjHJHgH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Aug 2023 03:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjHJHgH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Aug 2023 03:36:07 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C2010E7
        for <linux-rtc@vger.kernel.org>; Thu, 10 Aug 2023 00:36:06 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E75D9FF802;
        Thu, 10 Aug 2023 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1691652965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OdCF0jiXwkQLN7d07k/Koz1/dH9yW3YCS3u/MbhFvaA=;
        b=lSsQvLh/EfA0S3hYtClv/ulpGOBFpK3mBZ2eyYOj2dcAQpq51zCIsfxUUh7Q60yy8rBAAr
        tYQvwtVCMleTg4YfbOdSAJMIstBM913wD4/NbmQKib/XE+ilgzzhmDad6waR3SRfclCPKF
        /ndHBHxi9SzNzHLD9xtb5pmM+UQHvYCiaiNkLg/EX9HuggQ66F1CYXS7CH3MKazRpX/ntZ
        qI32U6/DPxBM8XCWiTscVFAx+tR3fCI2cPWOL+IzZt5G959/pBAKf8NRTnZ0tLZBJa70zV
        p8aRNNkO/PwJFfIItxkVe+pnZInumowtfjW2vkWdDd6waNzM63GgjBBlNy5KCQ==
Date:   Thu, 10 Aug 2023 09:36:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     vincent.sunplus@gmail.com, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, Chen Jiahao <chenjiahao16@huawei.com>
Subject: Re: [PATCH -next] rtc: sunplus: Clean up redundant dev_err_probe()
Message-ID: <169165294636.965520.7094796699821160544.b4-ty@bootlin.com>
References: <20230802093650.976352-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802093650.976352-1-chenjiahao16@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Wed, 02 Aug 2023 17:36:50 +0800, Chen Jiahao wrote:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Removing dev_err_probe() outside platform_get_irq() to clean up
> above problem.
> 
> [...]

Applied, thanks!

[1/1] rtc: sunplus: Clean up redundant dev_err_probe()
      commit: df9c16b5ccc8e4aab5e492b5f110167c75c74b0a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
