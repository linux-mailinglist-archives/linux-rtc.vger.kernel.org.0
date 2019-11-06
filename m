Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7377AF210E
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Nov 2019 22:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKFVsU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 Nov 2019 16:48:20 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:58440 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbfKFVsT (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 6 Nov 2019 16:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8xhVIvuFQsMtf2/Cr1aLwZDItnhm47cEr04p7WxqBBk=; b=Q/we3jVuZNUW3yjrBpx7D4lMTH
        gAO8zCmBEd13rar2osstULmfass26cqb+yH6o1ONljI4wxNE7vqaGpj2mMgwktY/iLB6Tz/102TCL
        7IA0//NqcDKe2TaOdk/lVZSJ6+qLbV0IEPGi2t1uVEcfcw7Z28Hzsc3Cm/VsBhEY2q6U=;
Received: from p200300ccff0a4d001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:4d00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iST9y-0004Vn-JQ; Wed, 06 Nov 2019 22:48:14 +0100
Date:   Wed, 6 Nov 2019 22:48:13 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 2/5] mfd: rn5t618: add irq support
Message-ID: <20191106224813.19cb26ea@aktux>
In-Reply-To: <20191031213835.11390-3-andreas@kemnade.info>
References: <20191031213835.11390-1-andreas@kemnade.info>
        <20191031213835.11390-3-andreas@kemnade.info>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 31 Oct 2019 22:38:32 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> This adds support for irq handling in the rc5t619 which is required
> for properly implementing subdevices like rtc.
> For now only definitions for the variant rc5t619 are included.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

after having some more look at it, I think I should note the interrupts
property in the bindings documentation since it gets used by using
i2c->irq. Will probably send a v3 the next days. 

Regards,
Andreas
