Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DE84D1D6B
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Mar 2022 17:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbiCHQjx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Mar 2022 11:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245549AbiCHQjw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Mar 2022 11:39:52 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0793A5132A;
        Tue,  8 Mar 2022 08:38:54 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0CA0460014;
        Tue,  8 Mar 2022 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646757533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ar15UUDK0Uj3i4vSimMBwYtNvLRx//2YEMokZ7LBbRI=;
        b=CGdSBasxLK8ws6pqdxTtNm/Kj+xIGifjs3ojexJj4p0PM2gMol1iA3t+MpBM7d36pfyMOL
        a7C51irNJnLm3wAYQlnvcj4TPomMCRdASX4AXZ1OymKm+YUX/2Gn4UDbsjA3on71s9vi9I
        yDhVWPZ1/MjxwcHlpayeH7P7Qmcx1JIiGeQgoByXGcpFhdm+/pCupQZsEi3hAwLGhk72y2
        k8UOTwnz2j8FB7GLi/y2gKj0TqI/XlVlEIscNe+FSiqXRRFz0zlMM4e7/kR6WdZSDioFqp
        A8+kcCixoKuwhJC1osJNcN7KIEOeG1vOwlR4WTpWDHGobNXqkXGnxxG79gHtHA==
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>, stable@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc-mc146818-lib: fix locking in mc146818_set_time
Date:   Tue,  8 Mar 2022 17:38:52 +0100
Message-Id: <164675751806.57812.5024159758490370034.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220090403.153928-1-mat.jonczyk@o2.pl>
References: <20220220090403.153928-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 20 Feb 2022 10:04:03 +0100, Mateusz Jończyk wrote:
> In mc146818_set_time(), CMOS_READ(RTC_CONTROL) was performed without the
> rtc_lock taken, which is required for CMOS accesses. Fix this.
> 
> Nothing in kernel modifies RTC_DM_BINARY, so a separate critical section
> is allowed here.
> 
> 
> [...]

Applied, thanks!

[1/1] rtc-mc146818-lib: fix locking in mc146818_set_time
      commit: c63cdb340a7e0bd3734f9f8e27f082a054b45887

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
