Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8164B2F4033
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Jan 2021 01:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387923AbhALXTY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Jan 2021 18:19:24 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57147 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbhALXTY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Jan 2021 18:19:24 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9216C20003;
        Tue, 12 Jan 2021 23:18:41 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     mark.rutland@arm.com, a.zummo@towertech.it, robh+dt@kernel.org,
        ludovic.desroches@microchip.com,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        nicolas.ferre@microchip.com
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: at91rm9200: add sama7g5 compatible
Date:   Wed, 13 Jan 2021 00:18:41 +0100
Message-Id: <161049349867.350232.16389357056805084271.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1610016372-31784-1-git-send-email-claudiu.beznea@microchip.com>
References: <1610016372-31784-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 7 Jan 2021 12:46:12 +0200, Claudiu Beznea wrote:
> Add compatible for SAMA7G5 RTC. At the moment the driver is falling
> back on SAM9X60's compatible but SAMA7G5 doesn't have the tamper mode
> register and tamper debounce period register thus the need for a new
> compatible to differentiate b/w these two in case tamper feature will
> be implemented in future.

Applied, thanks!

[1/1] dt-bindings: rtc: at91rm9200: add sama7g5 compatible
      commit: 51f9b1f8ee3a066f2f874cf64afea24ae762ff93

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
