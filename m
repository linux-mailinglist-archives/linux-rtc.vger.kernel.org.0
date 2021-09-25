Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3140C4184EA
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Sep 2021 00:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhIYWU5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 18:20:57 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:8643 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbhIYWU4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 18:20:56 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E8937240006;
        Sat, 25 Sep 2021 22:19:19 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh+dt@kernel.org>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Sun, 26 Sep 2021 00:19:19 +0200
Message-Id: <163260829684.44232.3142105218261149374.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823171613.18941-2-romain.perier@gmail.com>
References: <20210823171613.18941-1-romain.perier@gmail.com> <20210823171613.18941-2-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 23 Aug 2021 19:16:11 +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e RTC driver, found from MSC313e SoCs and newer.
> 
> 

Applied, thanks!

[1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
      commit: dd49cbedde8a0f1e0d09698f9cad791d37a8e03e

[2/3] rtc: Add support for the MSTAR MSC313 RTC
      commit: be7d9c9161b9c76edeff15e79edc2f256568fe05


Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
