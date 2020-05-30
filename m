Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D0A1E8CF7
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 03:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgE3B4H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 21:56:07 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47717 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgE3B4H (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 21:56:07 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DA0A020007;
        Sat, 30 May 2020 01:56:05 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc: rv3028: add the missed check for devm_regmap_init_i2c
Date:   Sat, 30 May 2020 03:56:05 +0200
Message-Id: <159080373404.314949.11387647905751548625.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527150704.539315-1-hslester96@gmail.com>
References: <20200527150704.539315-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 27 May 2020 23:07:04 +0800, Chuhong Yuan wrote:
> rv3028_probe() misses a check for devm_regmap_init_i2c().
> Add the missed check to fix it.

Applied, thanks!

[1/1] rtc: rv3028: add the missed check for devm_regmap_init_i2c

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
