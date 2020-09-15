Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EE126A311
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 12:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIOK0L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 06:26:11 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42667 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOK0K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 06:26:10 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D24451C000C;
        Tue, 15 Sep 2020 10:26:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, leoyang.li@nxp.com,
        Biwen Li <biwen.li@oss.nxp.com>, mark.rutland@arm.com
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] rtc: pcf2127: fix a bug when not specify interrupts property
Date:   Tue, 15 Sep 2020 12:26:07 +0200
Message-Id: <160016555162.333730.37689786875063582.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200915073213.12779-1-biwen.li@oss.nxp.com>
References: <20200915073213.12779-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 15 Sep 2020 15:32:09 +0800, Biwen Li wrote:
> Fix a bug when not specify interrupts property in dts
> as follows,
>     rtc-pcf2127-i2c 1-0051: failed to request alarm irq
>     rtc-pcf2127-i2c: probe of 1-0051 failed with error -22

Applied, thanks!

[1/1] rtc: pcf2127: fix a bug when not specify interrupts property
      commit: 35425bafc772ee189e3c3790d7c672b80ba65909

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
