Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C777BA488A
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Sep 2019 11:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfIAJQd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Sep 2019 05:16:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57893 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbfIAJQc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Sep 2019 05:16:32 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 66BA720002;
        Sun,  1 Sep 2019 09:16:30 +0000 (UTC)
Date:   Sun, 1 Sep 2019 11:16:29 +0200
From:   Alexandre Belloni <alexandre.belloni@free-electrons.com>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: rtc: add missing rx8130 compatible
Message-ID: <20190901091629.GZ21922@piout.net>
References: <20190830134755.1121-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830134755.1121-1-bst@pengutronix.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/08/2019 15:47:55+0200, Bastian Krause wrote:
> The required OF entries were added with 47dd47292828
> ("rtc: ds1307: add OF and ACPI entries for Epson RX8130").
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
