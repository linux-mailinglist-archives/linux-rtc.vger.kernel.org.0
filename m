Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBB8C628848
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Nov 2022 19:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236828AbiKNSZr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Nov 2022 13:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236816AbiKNSZp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Nov 2022 13:25:45 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255F42DA96
        for <linux-rtc@vger.kernel.org>; Mon, 14 Nov 2022 10:25:43 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0252624000B;
        Mon, 14 Nov 2022 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668450341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q5d6Vm1qngCMkcaF2mK9751LbskoZoBZCRhZowRPV0k=;
        b=dWc1wkHgvY/Ow/J+GE7d0fNQs57h4FsB+QIJ3FaX4VWDmPOnSxqahyrN51gyCT7raGjn6m
        +9auu37FQZzcu4jn1GbJOgbj3umQrf/4q9kgPyCglPhiinpaI4SQliTUBSJlmKtmJ01VUF
        cUJdJ4HWe1cr0f23WK2V9TZAGhEGxo/rl9RaqXLPbRxQwYHwcvYm0G85CZgHxYXBMVucB/
        LLnjGdDcPoiWcSwbFZfxZvFZrHAW9PTGkUophEQ8HlLAeiP7w3SxJtq1NKWhxgis/qIlsw
        p21r6zPPG6wNbKTpqpQKjDsbBN7vsi8TI2ahOHbgZucQRdXQ09M20t7s8LB1QQ==
Date:   Mon, 14 Nov 2022 19:25:40 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     a.zummo@towertech.it
Subject: Re: [PATCH -next] rtc: s3c: Switch to use dev_err_probe() helper
Message-ID: <166845032297.2098652.1742029406331683498.b4-ty@bootlin.com>
References: <20220919083812.755082-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919083812.755082-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 19 Sep 2022 16:38:12 +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name.
> 
> 

Applied, thanks!

[1/1] rtc: s3c: Switch to use dev_err_probe() helper
      commit: 25c9da5a536efb9eac59aaa6c1466935841cf694

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
