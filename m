Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A043127D7E8
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Sep 2020 22:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgI2UTl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Sep 2020 16:19:41 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33887 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgI2UTl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Sep 2020 16:19:41 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D69641C000A;
        Tue, 29 Sep 2020 20:19:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Liu Shixin <liushixin2@huawei.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] rtc: meson: simplify the return expression of meson_vrtc_probe
Date:   Tue, 29 Sep 2020 22:19:35 +0200
Message-Id: <160141075616.2802191.14464973075596319249.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919100856.1639319-1-liushixin2@huawei.com>
References: <20200919100856.1639319-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 19 Sep 2020 18:08:56 +0800, Liu Shixin wrote:
> Simplify the return expression.

Applied, thanks!

[1/1] rtc: meson: simplify the return expression of meson_vrtc_probe
      commit: 9ce42e8e0323d39fad01f3d17c35dd16d91c4f46

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
