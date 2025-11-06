Return-Path: <linux-rtc+bounces-5283-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E4C3B9CA
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 15:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF315676BC
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 14:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D87339B2A;
	Thu,  6 Nov 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO6dqYRv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F821D9663;
	Thu,  6 Nov 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437658; cv=none; b=hrLTqMfrjrDugdmQaYUTNtIxKIZbD0UlRVhV4Lkc8YvokYpT9oKG3u0MdewZWAI4t0GCnwqMP3lRVdjKZAm+7dfnTo3ugWt/6sR/5AU2UeUpToPwVCnFpa1qKcjlGGvXJTLFNr5AJ7/Lg2j66e3JrkTMe1rTxggDKRcdEXxPOWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437658; c=relaxed/simple;
	bh=82aafwmRzEUr/9hjLRrQOVgrkwH3sfNcUjGioV/rnbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boomj657Lf66dhwRY42t+zPffDWaFGcbwOVt8X6eRtU2WtxhZ1M+6pHGndRpieavtojbmSlBhxuIUKzVlinttMqS+DljO+6Z+hRa4CqCSAPUjLlnfi5gxRJgWDp/vSx2tdXKtizvdecTfFsR0PIFtRZbx3sfdXLvw/1bMXCOrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO6dqYRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BFC19421;
	Thu,  6 Nov 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437657;
	bh=82aafwmRzEUr/9hjLRrQOVgrkwH3sfNcUjGioV/rnbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rO6dqYRv/qSbLypbprhjvGU7B0ZV5J3JyxSGTKIxOpnVfiv27Ef4zLG/1MXXy4umG
	 fdkXy0+6ybPH+o0LznPj3bUHtlcjB0U1t9wg+7GEYV6IT7raJA+IU8qixctSJ9CdXs
	 03Ma18xk4lwm18OFIgbrGQ5KhYECLtihtCxD/j2PCzG+GGyyDeYOsFoNytSiUAve2x
	 akoqOIxagGuJg+i/J56OGvBK+V32l4BqdmCsBGhmw68ZOt3eCSB9109EUhrv6kyDIY
	 E7Cxc7wk+C41OdGbVQZX0KP6nlG9CyTZKXgx6cjFQQ4Vgd9lUh0Kg0Itb+xV3VKxVR
	 rSVzYuOmcPscw==
Date: Thu, 6 Nov 2025 14:00:50 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and HWMON due for the v6.19
 merge window
Message-ID: <20251106140050.GQ8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
 <20251025-macsmc-subdevs-v4-6-374d5c9eba0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-6-374d5c9eba0e@gmail.com>

Whoever takes this driver will need to pull the following:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-hwmon-v6.19

for you to fetch changes up to b340412a3b22b60b5e19cce8726940c7b5b14439:

  mfd: macsmc: Add new __SMC_KEY macro (2025-11-06 13:58:42 +0000)

----------------------------------------------------------------
Immutable branch between MFD and HWMON due for the v6.19 merge window

----------------------------------------------------------------
James Calligeros (1):
      mfd: macsmc: Add new __SMC_KEY macro

 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)
-- 
Lee Jones [李琼斯]

