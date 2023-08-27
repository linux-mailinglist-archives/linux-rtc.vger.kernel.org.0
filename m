Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4A78A281
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 00:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjH0WKy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 27 Aug 2023 18:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjH0WK0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 27 Aug 2023 18:10:26 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B92B6;
        Sun, 27 Aug 2023 15:10:23 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85E35FF803;
        Sun, 27 Aug 2023 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1693174222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YcUiYaXf7zns/L2Dectt4uDXbRSaTrhVVpjU0ADd+Jc=;
        b=YFn6AHAiCNYA6ly7xSE1qADo+8KP50aUKUi1vN4MXIfMyVljxfywT+iDlHPeVVeBztP7gm
        vXSDGXbZDLgkt9DL3r2JfzSnADmjuLdqEEqP5jTJN/sjL/WP4HKJVwgrIHUYw2LKlPnHVQ
        zFPyyvyGrp05GofwPasDaTuuZ1eCUdgWLBu9suudHviC9ej1ZDbpJ0k4+KLfYfrY4JktSK
        dLjR2Ndw9sbM4nY+Inbh4paELjdJutPF0uRzbpNWICCiVmtr/mdGQ58ZhRidq5s3lIkKUh
        mII6NxHBVwUqi8KXUDDseMZ7nOJh3lZKhz4L3SP3YmyXzVwAYqYt46rQcgEfPA==
Date:   Mon, 28 Aug 2023 00:10:22 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <169317420110.540243.15370748706612079038.b4-ty@bootlin.com>
References: <ZDf7qZTiml0ijD2g@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDf7qZTiml0ijD2g@lenoch>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Thu, 13 Apr 2023 14:55:05 +0200, Ladislav Michl wrote:
> Export SRAM using nvmem.
> 
> 

Applied, thanks!

[1/1] rtc: rtc-twl: add NVRAM support
      commit: 7130856f56054a031c492d37896cbcbfd04a61b5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
