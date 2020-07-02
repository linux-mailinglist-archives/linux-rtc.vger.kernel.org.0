Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCE8212DDB
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2020 22:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgGBU3q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jul 2020 16:29:46 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42177 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBU3q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jul 2020 16:29:46 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8A1391C0003;
        Thu,  2 Jul 2020 20:29:43 +0000 (UTC)
Date:   Thu, 2 Jul 2020 22:29:43 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Tales L. da Aparecida" <tales.aparecida@gmail.com>,
        a.zummo@towertech.it, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, shawnguo@kernel.org, festevam@gmail.com,
        s.hauer@pengutronix.de, linux-rtc@vger.kernel.org
Cc:     andrealmeid@collabora.com
Subject: Re: [PATCH] rtc: imxdi: fix trivial typos
Message-ID: <159372166563.58845.16228028270667988480.b4-ty@bootlin.com>
References: <20200624012119.54768-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624012119.54768-1-tales.aparecida@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 23 Jun 2020 22:21:19 -0300, Tales L. da Aparecida wrote:
> Fix typos 'pionter' -> 'pointer' and 'softwere' -> 'software'

Applied, thanks!

[1/1] rtc: imxdi: fix trivial typos
      commit: a8220fcf35014eacb4529b986e8d04fc68ea0315

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
