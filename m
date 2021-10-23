Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6E3438596
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Oct 2021 23:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhJWVxO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Oct 2021 17:53:14 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59467 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhJWVxN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Oct 2021 17:53:13 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 708BA1BF207;
        Sat, 23 Oct 2021 21:50:49 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 6/9] rtc: sun6i: Allow probing without an early clock provider
Date:   Sat, 23 Oct 2021 23:50:48 +0200
Message-Id: <163502583211.396329.16763679649213996205.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928080335.36706-7-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org> <20210928080335.36706-7-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 28 Sep 2021 03:03:32 -0500, Samuel Holland wrote:
> Some SoCs have an RTC supported by this RTC driver, but do not have an
> early clock provider declared here. Currently, this prevents the RTC
> driver from probing, because it expects a global struct to already be
> allocated. Fix probing the driver by copying the missing pieces from the
> clock provider setup function, replacing them with the devm variants.
> 
> 
> [...]

Applied, thanks!

[6/9] rtc: sun6i: Allow probing without an early clock provider
      commit: 814691c7f7d1f958ac30c3dca5070a95c1f658dd

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
