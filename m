Return-Path: <linux-rtc+bounces-3964-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB9A8A38D
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Apr 2025 18:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 584A13BA459
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Apr 2025 16:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A231D1A724C;
	Tue, 15 Apr 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aANLp776"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2258F5E;
	Tue, 15 Apr 2025 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732940; cv=none; b=t0t5vTqfNAy4eOrJ+LZiqStyGqp7z5fEzYjAIMVx9t441cCSU9sbc0awlsvXGEbC1l8Q/dtU2gTW1Fyci7CUAhfpcu181J6S1gQsNgNsFCiQZJsL0ZpAG0xznmmcvfAcfNPpkJTQimBSQwe++LsI97rmZnAWycmRnsXtcgqCrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732940; c=relaxed/simple;
	bh=7Rmh8vV6GpjW8tGOLmzMipD5iUxBweVFlC56ryJ2b3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvx2vWv49ptr+vthDshvcYaPY0YEz3NfZ4gtKQcKPCCC97UrPO2r9lVBAs2gEHpMaNqvzgY8ftg/N6eeYlRM9oVc/RsC0eaKv1Tiu6sWAQzBENrlGm/tpyvoR9fcyK/3wo9dfUBIGcT6jkCuUW6qAglQ35CwORchl/XQqiWuoUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aANLp776; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DCFC4CEEB;
	Tue, 15 Apr 2025 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744732939;
	bh=7Rmh8vV6GpjW8tGOLmzMipD5iUxBweVFlC56ryJ2b3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aANLp776GKPJr5pXAnfPCvusHmJYG8nzy62olk0fqthF3OToJIaIlkaCECG05ghZ8
	 Un00ln3T/UclXpdbp+IwVgad5hUelMoCgjZ3JLblQuDGZosgZlH/w+UmFazy/FcEQe
	 QKCKWF0mFzEG9r2zEcWuheOQPeBVknSgquyecaSIgfO+nu2Oopa/Afub5Z31RQXzl9
	 SYCRm9kl1WT275bzi0f487LXy0Kb8n2F2RLBY9uAq23ZrZqlQDGdMNBpTkhr2yFx+T
	 mO2GEdOLLSGBD0mgsJFep3vPLvT29DE/BOI1TWKCvdyOagM0TqAo+QPFE2K9xRtJLj
	 HXdR/+0rgoqvQ==
Date: Tue, 15 Apr 2025 17:02:12 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250415160212.GA372032@google.com>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>

On Wed, 09 Apr 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/
> 
> *** dependency note end ***
> 
> +++ Kconfig update +++
> 
> There is a Kconfig symbol update in this series, because the existing
> Samsung S2M driver has been split into core and transport (I2C & ACPM)
> parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
> the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.
> 
> This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
> talk via I2C, but via the Samsung ACPM firmware.
> 
> +++ Kconfig update end +++
> 
> This series must be applied in-order, due to interdependencies of some
> of the patches. There are also various cleanup patches to the S2M
> drivers. I've kept them ordered as:
>   * DT bindings (patches 1 ... 3)
>   * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
>   * split S2M mfd driver into s2m-core and s2m-i2c, including the
>     kconfig symbol update (patch 8)
>   * S2MPG10 core driver (patch 9)
>   * s2m mfd driver cleanup patches (patches 10 ... 23)
>   * S2MPG10 clock driver (patch 24)
>   * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
>   * S2MPG10 RTC driver (patch 27)
>   * s2m RTC cleanup patches (patches 28 ... 31)
> 
> I realise these are many, but since some prep-work was required to be
> able to add S2MPG anyway, I wanted to get the cleanup patches in as
> well :-) Let me know if I should postpone them to a later date instead.
> 
> The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
> clock outputs, and additional GPIOs interfaces.
> 
> This series adds support in the top-level device driver, and for the
> RTC and clock. Importantly, having the RTC driver allows to do a proper
> reset of the system. Drivers or driver updates for the other components
> will be added in future patches.
> 
> This will need a DT update for Oriole / Raven to enable this device. I
> will send that out separately.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> Changes in v4:
> - various updates to sec-acpm (patch 9, Lee)
> - cache enum type in patch 25 (Krzysztof)
> - collect tags
> - Link to v3: https://lore.kernel.org/r/20250403-s2mpg10-v3-0-b542b3505e68@linaro.org
> 
> Changes in v3:
> - Krzysztof:
>   - keep 'regulators' subnode required even for s2mpg10
>   - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
>     'additionalProperties' instead
>   - add some regulators to examples since s2mpg10 requires them as of
>     v3
> - sec-acpm:
>   - use an enum for struct sec_acpm_bus_context::type
>   - consistent name space for all functions sec_pmic_acpm_... to be
>     similar to i2c and consistent in this file
> - Link to v2: https://lore.kernel.org/r/20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org
> 
> Changes in v2:
> - Rob:
>   - make PMIC node a child of ACPM, and all related changes (binding,
>     driver)
> - Krzysztof:
>   - merge defconfig updates into patch changing the symbols (patch 8)
>   - split MODULE_AUTHOR update into a separate patch
>   - better alignment fix (patch 11)
>   - merge two s2dos05/s2mpu05 related patches into one (patch 14)
> - myself:
>   - keep PMIC DT parsing in core, not in transport driver
>   - several updates in sec-acpm.c, see separate entries in patch 9
>   - fix typo in patch 17
>   - collect tags
> - Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org
> 
> ---
> André Draszik (32):
>       dt-bindings: mfd: samsung,s2mps11: add s2mpg10
>       dt-bindings: clock: samsung,s2mps11: add s2mpg10
>       dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
>       mfd: sec-core: Drop non-existing forward declarations
>       mfd: sec: Sort includes alphabetically
>       mfd: sec: Update includes to add missing and remove superfluous ones
>       mfd: sec: Move private internal API to internal header
>       mfd: sec: Split into core and transport (i2c) drivers
>       mfd: sec: Add support for S2MPG10 PMIC
>       mfd: sec: Merge separate core and irq modules
>       mfd: sec-common: Fix multiple trivial whitespace issues
>       mfd: sec-i2c: Sort struct of_device_id entries and the device type switch
>       mfd: sec: Use dev_err_probe() where appropriate
>       mfd: sec-i2c: s2dos05/s2mpu05: Use explicit regmap config and drop default
>       mfd: sec-irq: s2dos05 doesn't support interrupts
>       mfd: sec-common: Don't ignore errors from sec_irq_init()
>       mfd: sec-i2c: Rework platform data and regmap instantiating
>       mfd: sec: Change device_type to int
>       mfd: sec: Don't compare against NULL / 0 for errors, use !
>       mfd: sec-common: Use sizeof(*var), not sizeof(struct type_of_var)
>       mfd: sec-common: Convert to using MFD_CELL macros
>       mfd: sec-irq: Convert to using REGMAP_IRQ_REG() macros
>       mfd: sec: Add myself as module author
>       clk: s2mps11: add support for S2MPG10 PMIC clock
>       rtc: s5m: cache device type during probe
>       rtc: s5m: prepare for external regmap
>       rtc: s5m: add support for S2MPG10 RTC
>       rtc: s5m: fix a typo: peding -> pending
>       rtc: s5m: switch to devm_device_init_wakeup
>       rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
>       rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
>       MAINTAINERS: add myself as reviewer for Samsung S2M MFD
> 
>  .../devicetree/bindings/clock/samsung,s2mps11.yaml |   1 +
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  35 ++
>  .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  26 +-
>  MAINTAINERS                                        |   3 +-
>  arch/arm/configs/exynos_defconfig                  |   2 +-
>  arch/arm/configs/multi_v7_defconfig                |   2 +-
>  arch/arm/configs/pxa_defconfig                     |   2 +-
>  arch/arm64/configs/defconfig                       |   2 +-

>  drivers/clk/clk-s2mps11.c                          |   8 +

>  drivers/mfd/Kconfig                                |  35 +-
>  drivers/mfd/Makefile                               |   5 +-
>  drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
>  drivers/mfd/sec-common.c                           | 301 +++++++++++++
>  drivers/mfd/sec-core.c                             | 481 ---------------------
>  drivers/mfd/sec-core.h                             |  23 +
>  drivers/mfd/sec-i2c.c                              | 239 ++++++++++
>  drivers/mfd/sec-irq.c                              | 460 +++++++-------------

>  drivers/rtc/rtc-s5m.c                              | 197 ++++++---

MFD parts look okay to me now.

With Acks from the Clk and RTC maintainers, I can merge all of the
driver stuff together and submit a PR for others to pull from.

>  include/linux/mfd/samsung/core.h                   |   7 +-
>  include/linux/mfd/samsung/irq.h                    | 103 +++++
>  include/linux/mfd/samsung/rtc.h                    |  37 ++
>  include/linux/mfd/samsung/s2mpg10.h                | 454 +++++++++++++++++++
>  22 files changed, 2001 insertions(+), 864 deletions(-)
> ---
> base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
> change-id: 20250321-s2mpg10-ef5d1ebd3043
> 
> Best regards,
> -- 
> André Draszik <andre.draszik@linaro.org>
> 

-- 
Lee Jones [李琼斯]

