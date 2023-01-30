Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B496810AA
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Jan 2023 15:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjA3OFl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Jan 2023 09:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237067AbjA3OFl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Jan 2023 09:05:41 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B603B3FF
        for <linux-rtc@vger.kernel.org>; Mon, 30 Jan 2023 06:05:34 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5642D1BF20B;
        Mon, 30 Jan 2023 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675087533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jIf226ATaB7+TMqBtzzV8846/iWFM+jprpXimpZQxMY=;
        b=hgQqoboNR8+WifIXQiKCU8EE/cnOPdglqYlYXCcb7O4JmG1dF0/aI5UEjEeQ+v6ucVRBpR
        eAmhh8HzEN0TSTP4PfYZBVSzm9pYHUDxS+OG58ecWd/iDeGgxBzePm6yOW2B7KY7Rqgg7s
        QL90ahy2ERqHjVGaxpOU/hyIMhzLLTWOpT+CcNjYTbTU15GgD82srpB8JDUmtja9XUdZuQ
        +JXj8Y5hOVdYirOZkEbWn4einPcfvdrAtYqGvPYZcLzHmwIqadFU72hkHpxcm8c+WjKmw/
        kO2xs+HyVfEn3MlurX9/AwKtOxNZSXGMJHijoK9j3b81aQvvCHXCcn259sXaQQ==
Date:   Mon, 30 Jan 2023 15:05:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: max8907: Drop unused i2c include
Message-ID: <167508749942.281143.2998885730570668397.b4-ty@bootlin.com>
References: <20221219081440.1399791-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219081440.1399791-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Mon, 19 Dec 2022 09:14:40 +0100, Uwe Kleine-König wrote:
> rtc-max8907 is a platform driver that doesn't use any symbol provided in
> <linux/i2c.h>. So drop the include.
> 

Applied, thanks!

[1/1] rtc: max8907: Drop unused i2c include
      commit: 337d56ec6c869cb777f0f0156735467d6bc5fbeb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
