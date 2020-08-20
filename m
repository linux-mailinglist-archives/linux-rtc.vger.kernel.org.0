Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA34424C7AE
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Aug 2020 00:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgHTWTV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Aug 2020 18:19:21 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34259 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgHTWTV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Aug 2020 18:19:21 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D7E7060003;
        Thu, 20 Aug 2020 22:19:17 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1307: Ensure oscillator is enabled for DS1388
Date:   Fri, 21 Aug 2020 00:19:17 +0200
Message-Id: <159796194488.2240479.15277965351835243042.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200816235731.21071-1-chris.packham@alliedtelesis.co.nz>
References: <20200816235731.21071-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 17 Aug 2020 11:57:31 +1200, Chris Packham wrote:
> Similar to the other variants the DS1388 has a bit to stop the
> oscillator to reduce the power consumption from VBAT. Ensure that the
> oscillator is enabled when the system is up.

Applied, thanks!

[1/1] rtc: ds1307: Ensure oscillator is enabled for DS1388
      commit: 59ed0127155201863db49f3dc5fb41316433340a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
