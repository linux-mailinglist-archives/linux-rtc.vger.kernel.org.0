Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB755476E2A
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Dec 2021 10:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhLPJts (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Dec 2021 04:49:48 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:41089 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhLPJts (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Dec 2021 04:49:48 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2E19A200009;
        Thu, 16 Dec 2021 09:49:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        linux-rtc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, Ash Logan <ash@heyquark.com>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube, Wii and Wii U
Date:   Thu, 16 Dec 2021 10:49:44 +0100
Message-Id: <163964813197.6786.14005810276404182021.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215175501.6761-1-linkmauve@linkmauve.fr>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr> <20211215175501.6761-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 15 Dec 2021 18:54:56 +0100, Emmanuel Gil Peyrot wrote:
> These three consoles share a device, the MX23L4005, which contains a
> clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
> (similar to SPI) on channel 0, device 1.  This driver allows it to be
> used as a Linux RTC device, where time can be read and set.
> 
> The hardware also exposes two timers, one which shuts down the console
> and one which powers it on, but these aren’t supported currently.
> 
> [...]

Applied, thanks!

[1/5] rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
      commit: 86559400b3ef9de93ba50523cffe767c35cd531a
[2/5] rtc: gamecube: Report low battery as invalid data
      commit: 322539a014bcd24cbb9281832c09b24e07912237
[3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
      commit: 5479618e1e2641dd57352a73b7b7b2f6908fbeee
[4/5] powerpc: gamecube_defconfig: Enable the RTC driver
      commit: 57bd7d356506b713d0df8d8e42da7810a18864df
[5/5] powerpc: wii_defconfig: Enable the RTC driver
      commit: 69e8ba80ddda4db31e59facbf2db19773ad3785b

This one didn't apply ceanly but I believe I did the right thing. Can you check?


Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
