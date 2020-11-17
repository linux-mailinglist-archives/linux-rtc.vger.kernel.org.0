Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4652B71DF
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 23:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgKQW5P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 17:57:15 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:58827 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgKQW5O (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 17:57:14 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A81D0200003;
        Tue, 17 Nov 2020 22:57:12 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/8] rtc: rework resource management
Date:   Tue, 17 Nov 2020 23:57:12 +0100
Message-Id: <160565277025.1301380.11405409866818825125.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109163409.24301-1-brgl@bgdev.pl>
References: <20201109163409.24301-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 9 Nov 2020 17:34:01 +0100, Bartosz Golaszewski wrote:
> As discussed: this is my take on RTC devres. The series does a couple things:
> it adds missing documentation of managed RTC functions, adds the 'devm_' prefix
> to managed APIs, makes the rtc_device struct unaware of being managed (removes
> the registered field) and also shrinks devm_rtc_allocate_device().
> 
> Other than that, there are some semi-related patches in here, like the one
> using the managed variant of pinctrl_register() in rtc-omap and another one
> adding a generic error message when nvmem registraton fails.
> 
> [...]

Applied, thanks!

[1/8] rtc: omap: use devm_pinctrl_register()
      commit: a2d41cdac82332c52c13cb2ef225804eabd5a17c
[3/8] Documentation: list RTC devres helpers in devres.rst
      commit: 9700e2835743c98a9867711133c64cc7f57be477
[4/8] rtc: nvmem: remove nvram ABI
      commit: 003006f324d265b69afd18496bc06ee076c70d72
[5/8] rtc: add devm_ prefix to rtc_nvmem_register()
      commit: ae1907b39574c545e4c5f0e038e85d57f6358080
[6/8] rtc: nvmem: emit an error message when nvmem registration fails
      commit: ffb1ecf7f7cc3e0b6f3fc7f445cc405ccb52d048
[7/8] rtc: rework rtc_register_device() resource management
      commit: 9703f757249afc4c558c8712e953b5b33a73e379
[8/8] rtc: shrink devm_rtc_allocate_device()
      commit: 27f554c580c8ec9015aec3d998510cf462534e48

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
