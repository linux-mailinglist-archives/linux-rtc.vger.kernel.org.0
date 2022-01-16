Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6AD48FF76
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jan 2022 23:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236340AbiAPWfA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Jan 2022 17:35:00 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:39143 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbiAPWfA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Jan 2022 17:35:00 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7019F240003;
        Sun, 16 Jan 2022 22:34:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        qat-linux@intel.com, linux-crypto@vger.kernel.org,
        Fiona Trahe <fiona.trahe@intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "David S. Miller" <davem@davemloft.net>,
        Tomasz Kowalik <tomaszx.kowalik@intel.com>,
        Marco Chiappero <marco.chiappero@intel.com>,
        kernel-janitors@vger.kernel.org, linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>
Subject: Re: [PATCH] rtc: mc146818-lib: fix signedness bug in mc146818_get_time()
Date:   Sun, 16 Jan 2022 23:34:55 +0100
Message-Id: <164237248842.3515408.2249238956067957.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111071922.GE11243@kili>
References: <20220111071922.GE11243@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 11 Jan 2022 10:19:22 +0300, Dan Carpenter wrote:
> The mc146818_get_time() function returns zero on success or negative
> a error code on failure.  It needs to be type int.
> 
> 

Applied, thanks!

[1/1] rtc: mc146818-lib: fix signedness bug in mc146818_get_time()
      commit: 7372971c1be5b7d4fdd8ad237798bdc1d1d54162

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
