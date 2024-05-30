Return-Path: <linux-rtc+bounces-1225-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876C8D4CD4
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 15:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24094283FF9
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 13:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A551667DC;
	Thu, 30 May 2024 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="XekgKm1J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E417C23E
	for <linux-rtc@vger.kernel.org>; Thu, 30 May 2024 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076009; cv=none; b=hNurNTF71ifTQg5+L8xXGwleGztXGIJmSWQNsp4CBCx6r439zT3X4E1zOcMXBQ7eRA2N18pTUeq5Vr/l73w3YUbli8R4nLcPM1LZo6mrSqEyeNRrNCpDRPK5t9/AoPJ118HBZh/0TjOFDrtpyIbUDw1Lu4hKGA9DFpPNJE/zY5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076009; c=relaxed/simple;
	bh=C1dRvkuMa/gwo1DaCwH8Vhm3pf717EYrgxZw29cV35w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fB+nQACiHZw+4QSExQ2v7W410cXA53RMFNgu/zP4a1B5DXK/HjmQ8elULs8Z85YVCgtac/vdp133P5Yx1BjpSfEHy0xRXjEN2e9/m6x08bcFsn1GRf0V53xNu1t//ODndgeGMk4DgIU+JMc+QxbzldRVKHuB42l8nVvMCJynzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=XekgKm1J; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 468691485B91
	for <linux-rtc@vger.kernel.org>; Thu, 30 May 2024 15:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1717075996; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding; bh=6hdzLu+JRWIm9HgdjGCAEnRyQw09EG2Uc18uvrnABtI=;
	b=XekgKm1J8KRjmdDc4r6UwQmQyHg51HVkSyuWBB5qaeKPBWEq1JrWJ6EY9bKIJwfoSgupsH
	uW3xmceuZ8t68TNS+fW29CYvUo/mXdR/rcA47Zw7WBZExMAIwKZJ4h2lkn3AcI7wob+1N5
	H+TsTgtjmjcXRZZs0fEQkf7BgZ+vn75dE8b0n23+bL1jdaCMV5uGocw1u2KSl9xpVw/WXP
	tOSlfoOHj3ZSuK2e03KPF6d+yBNVqP1NK38oSQpkYNNwWtVhdA5W6fzcz+ks1JrBatYAoR
	ZI871JwnOdUqV4JAYpXloAZINYiR0Iv9pMb1rUcGBBWUFndVg1icQnOAybhdAg==
Date: Thu, 30 May 2024 15:33:11 +0200
From: Alexander Dahl <ada@thorsis.com>
To: linux-rtc@vger.kernel.org
Subject: clkout vs. !int1 on nxp pcf8523
Message-ID: <20240530-tapioca-prominent-0a669c51c37c@thorsis.com>
Mail-Followup-To: Alexander Dahl <ada@thorsis.com>,
	linux-rtc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hei hei,

my current task is to bring up a new board featuring an at91 sam9x60
SoC and a nxp pcf8523 RTC.  The intention is to get a longer time the
RTC can run on a capacitor because the external RTC draws less current
than the internal RTC of the SoC.

To save boards space and parts the 32768 Hz crystal of the SoC should
be removed and the clkout of the external RTC should be used as a slow
clock input instead.

This is a somewhat known setup, at least I found other drivers
implementing it for certain boards, see commits
v5.15-rc1-16-g4c8a7b80d5f3 ("rtc: pcf85063: add support for fixed
clock") or v5.13-rc1-2-gf765e349c3e1 ("rtc: m41t80: add support for
fixed clock") for reference.

Problem with the pcf8523: it has a shared !INT1 / CLKOUT pin, and you
probably can use only either one or the other function.  Default after
reset is to have CLKOUT providing 32768 Hz, proved that with an
oscilloscope.

The naive way to add support is to just add a node to the dts and
cross fingers like this:

    &flx5 {
            atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
            status = "okay";
    
            i2c5: i2c@600 {
                    pinctrl-0 = <&pinctrl_flx5_default>;
                    status = "okay";
    
                    pcf8523: rtc@68 {
                            compatible = "nxp,pcf8523";
                            reg = <0x68>;
                    };
            };
    };

This actually works, but I suspect this is fragile, because it does
not describe the clock I want to use, nor how to handle the irq.

I noticed commit v5.12-rc2-22-g13e37b7fb75d ("rtc: pcf8523: add alarm
support") and the commit message somehow suggests clkout is always
disabled now?  Well not always, only if some irq was defined in … but
where exactly?  In my setup the clkout is not disabled, I confirmed
that with a scope.

This is where all kinds of questions rise.  The documentation on rtc
and i2c device tree bindings is somewhat sparse.  :-/

From my understanding if I wanted to use the !INT1 pin as an actual
interrupt line, I would probably hook it up to either a GPIO of the
SoC or some wakeup input of the PMIC.  What else is possible and how
would the different ways be expressed in .dts?  I found some .dts and
.dtsi files having an 'interrupts' property in the rtc node, but I did
not find the place in the code where this gets evaluated.

For clkout it is probably like in
arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi and the driver
changes would be maybe somewhat similar to the changes done in
drivers/rtc/rtc-pcf85063.c right?

Any hints on how to express in dts to _explicitly_ disable use as an
interrupt pin and explicitly as fixed clkout?  And what changes to the
pcf8523 driver would have to be done, if any?

Greets
Alex


