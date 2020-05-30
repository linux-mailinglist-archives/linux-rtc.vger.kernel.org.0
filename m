Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723701E8CDF
	for <lists+linux-rtc@lfdr.de>; Sat, 30 May 2020 03:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgE3Bct (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 21:32:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37139 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3Bct (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 21:32:49 -0400
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A82C2200004;
        Sat, 30 May 2020 01:32:44 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: goldfish: Use correct return value for goldfish_rtc_probe()
Date:   Sat, 30 May 2020 03:32:44 +0200
Message-Id: <159080235791.311419.12086929009515039595.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1590370788-15136-1-git-send-email-yangtiezhu@loongson.cn>
References: <1590370788-15136-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 25 May 2020 09:39:47 +0800, Tiezhu Yang wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.

Applied, thanks!

[1/2] rtc: goldfish: Use correct return value for goldfish_rtc_probe()
      commit: e712bb5c45313b3ab35ece2fb0a44cdc49548bd9
[2/2] rtc: mpc5121: Use correct return value for mpc5121_rtc_probe()
      commit: 4c2a13a2d686a7412d862802156eebd0e15df7ad

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
