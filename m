Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8759F2B3148
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 23:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgKNWyz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 17:54:55 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:29641 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgKNWyz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 17:54:55 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 77C1E240004;
        Sat, 14 Nov 2020 22:54:53 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        Xu Wang <vulab@iscas.ac.cn>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: snvs: Remove NULL pointer check before clk_*
Date:   Sat, 14 Nov 2020 23:54:52 +0100
Message-Id: <160539448425.850144.14521330664734562050.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113080305.65961-1-vulab@iscas.ac.cn>
References: <20201113080305.65961-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 13 Nov 2020 08:03:05 +0000, Xu Wang wrote:
> Because clk_* already checked NULL clock parameter,
> so the additional checks are unnecessary, just remove them.

Applied, thanks!

[1/1] rtc: snvs: Remove NULL pointer check before clk_*
      commit: 081e2500df50c7f330b9346794c6759ea7f8fb81

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
