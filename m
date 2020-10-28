Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D55B29DFB8
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Oct 2020 02:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404045AbgJ2BEU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Oct 2020 21:04:20 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34674 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729564AbgJ1WGk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Oct 2020 18:06:40 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id E58A23B0C1A;
        Wed, 28 Oct 2020 17:52:32 +0000 (UTC)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8E359240004;
        Wed, 28 Oct 2020 17:52:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     kjlu@umn.edu, Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] [v3] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
Date:   Wed, 28 Oct 2020 18:52:05 +0100
Message-Id: <160390751694.374708.7173123437808246701.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020061226.6572-1-dinghao.liu@zju.edu.cn>
References: <20201020061226.6572-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 20 Oct 2020 14:12:26 +0800, Dinghao Liu wrote:
> When clk_hw_register_fixed_rate_with_accuracy() fails,
> clk_data should be freed. It's the same for the subsequent
> two error paths, but we should also unregister the already
> registered clocks in them.

Applied, thanks!

[1/1] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
      commit: 28d211919e422f58c1e6c900e5810eee4f1ce4c8

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
