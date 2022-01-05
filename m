Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A26A484B6E
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jan 2022 01:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbiAEAFo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jan 2022 19:05:44 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60831 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236619AbiAEAFo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Jan 2022 19:05:44 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 645881C0002;
        Wed,  5 Jan 2022 00:05:42 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hugo Villeneuve <hugo@hugovil.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: Fix typo in comment
Date:   Wed,  5 Jan 2022 01:05:33 +0100
Message-Id: <164134112610.1688528.3518385542258380834.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211207215626.2619819-1-hugo@hugovil.com>
References: <20211207215626.2619819-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 7 Dec 2021 16:56:25 -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Replace TFS2 with TSF2.
> 
> 

Applied, thanks!

[1/1] rtc: pcf2127: Fix typo in comment
      commit: 7b69b54aaa48979f5e3cebb7225e11cbbdc9f5fb

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
