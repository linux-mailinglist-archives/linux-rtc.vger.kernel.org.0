Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0413AE04E
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 22:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFTUfs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 16:35:48 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50877 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFTUfq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 16:35:46 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 767C440004;
        Sun, 20 Jun 2021 20:33:31 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH V2] dt-bindings: rtc: rx8900: Convert to YAML schema
Date:   Sun, 20 Jun 2021 22:33:24 +0200
Message-Id: <162422118505.1090685.1886612416736440175.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610150044.29792-1-marex@denx.de>
References: <20210610150044.29792-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 10 Jun 2021 17:00:44 +0200, Marek Vasut wrote:
> Convert the Epson RX8900 DT bindings to YAML schema.

Applied, thanks!

[1/1] dt-bindings: rtc: rx8900: Convert to YAML schema
      commit: 7e124917809705f05e0c9f0f72a38102e6aa4eff

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
