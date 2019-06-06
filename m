Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C9A37123
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jun 2019 12:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfFFKBj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Jun 2019 06:01:39 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41359 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfFFKBj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Jun 2019 06:01:39 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7E9F0240023;
        Thu,  6 Jun 2019 10:01:33 +0000 (UTC)
Date:   Thu, 6 Jun 2019 12:01:32 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: rtc: Add YAML schemas for the
 generic RTC bindings
Message-ID: <20190606100132.GB5168@piout.net>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/05/2019 22:30:31+0200, Maxime Ripard wrote:
> The real time clocks have a bunch of generic properties that are needed in
> a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt  | 34 +-------------
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 50 +++++++++++++++++++-
>  2 files changed, 51 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc.yaml
> 
Applied 1 to 6, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
