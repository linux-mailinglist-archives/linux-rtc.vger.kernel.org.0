Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E623E62CD88
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Nov 2022 23:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbiKPWXN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Nov 2022 17:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiKPWXM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Nov 2022 17:23:12 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06686A69C
        for <linux-rtc@vger.kernel.org>; Wed, 16 Nov 2022 14:23:11 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C3167E0006;
        Wed, 16 Nov 2022 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668637390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+yH1MlYlXQ6olwVEtJ7wfwIfcUY3X5DS4qbh2jwwY3I=;
        b=E7eGm+mYLshhMXxhLjgluNylT1axpkryMhIKSpF56L3QSQf6Sg5NIdZfEZnDWkOnPKpK/s
        goPCOxV31eihGifWamjc2wmnAMQ53j1Tx3tY742OxmrlR0WRdc5NT1rzP/wgN4x0FHocP7
        jSkgxvFt+0nVKSAQD+InivoyVaamks5nLF6iXOhTCsH0Fd68AA1kTzNlHERnkCsRVuxpZJ
        8gPHBp9u+Lh4pf5vFFleNWHbmsUIZchFAaYspAbUleoVyI1ukptmvnJAmGvx9TXE09k3Jg
        fmLYCi2b6pE5yCc78TAVNSg3pLi+NvZAEzgktSCaPWeEZ/QxWBlqPDtJXCVd0A==
Date:   Wed, 16 Nov 2022 23:23:09 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: pcf85063: Fix reading alarm
Message-ID: <166863736660.2506361.8513449919640231939.b4-ty@bootlin.com>
References: <20220921074141.3903104-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921074141.3903104-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 21 Sep 2022 09:41:41 +0200, Alexander Stein wrote:
> If the alarms are disabled the topmost bit (AEN_*) is set in the alarm
> registers. This is also interpreted in BCD number leading to this warning:
> rtc rtc0: invalid alarm value: 2022-09-21T80:80:80
> 
> Fix this by masking alarm enabling and reserved bits.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85063: Fix reading alarm
      commit: a6ceee26fd5ed9b5bd37322b1ca88e4548cee4a3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
