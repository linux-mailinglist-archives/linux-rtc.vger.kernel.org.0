Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DA128EFC6
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 12:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730971AbgJOKBm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 06:01:42 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55011 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgJOKBl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 06:01:41 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EC0091BF21A;
        Thu, 15 Oct 2020 10:01:38 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eddie Huang <eddie.huang@mediatek.com>,
        Fei Shao <fshao@chromium.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Josef Friedl <josef.friedl@speed.at>,
        Lee Jones <lee.jones@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH] rtc: mt6397: Remove unused member dev
Date:   Thu, 15 Oct 2020 12:01:38 +0200
Message-Id: <160275608927.396360.10273105815365770898.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008093414.1911699-1-fshao@chromium.org>
References: <20201008093414.1911699-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 8 Oct 2020 17:34:14 +0800, Fei Shao wrote:
> Removing the struct member "dev" in mt6397 RTC driver because it's not
> initialized and the only usage is for one debugging message.
> 
> Also fixed a typo in the error message.

Applied, thanks!

[1/1] rtc: mt6397: Remove unused member dev
      commit: 770c03e6dabacd5b9f57bba93c4311d32b618640

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
