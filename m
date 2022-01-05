Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A52484B70
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jan 2022 01:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236619AbiAEAFr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jan 2022 19:05:47 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47149 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236628AbiAEAFp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Jan 2022 19:05:45 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3D044C0007;
        Wed,  5 Jan 2022 00:05:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Laurence de Bruxelles <lfdebrux@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] rtc: pxa: fix null pointer dereference
Date:   Wed,  5 Jan 2022 01:05:35 +0100
Message-Id: <164134112610.1688528.10111758319964602506.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220101154149.12026-1-lfdebrux@gmail.com>
References: <20220101154149.12026-1-lfdebrux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 1 Jan 2022 15:41:49 +0000, Laurence de Bruxelles wrote:
> With the latest stable kernel versions the rtc on the PXA based
> Zaurus does not work, when booting I see the following kernel messages:
> 
> pxa-rtc pxa-rtc: failed to find rtc clock source
> pxa-rtc pxa-rtc: Unable to init SA1100 RTC sub-device
> pxa-rtc: probe of pxa-rtc failed with error -2
> hctosys: unable to open rtc device (rtc0)
> 
> [...]

Applied, thanks!

[1/1] rtc: pxa: fix null pointer dereference
      commit: 34127b3632b21e5c391756e724b1198eb9917981

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
