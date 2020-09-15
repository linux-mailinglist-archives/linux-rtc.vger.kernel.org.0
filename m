Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B1E26A11E
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Sep 2020 10:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgIOInB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 04:43:01 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47985 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgIOIm5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 04:42:57 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C631B60012;
        Tue, 15 Sep 2020 08:42:54 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: s3c: Simplify with dev_err_probe()
Date:   Tue, 15 Sep 2020 10:42:54 +0200
Message-Id: <160015935667.271592.13737363660134545119.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200830080937.14367-1-krzk@kernel.org>
References: <20200830080937.14367-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 30 Aug 2020 10:09:37 +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.

Applied, thanks!

[1/1] rtc: s3c: Simplify with dev_err_probe()
      commit: c52d270c68a02f94c5c081b7fc57119058e4670a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
