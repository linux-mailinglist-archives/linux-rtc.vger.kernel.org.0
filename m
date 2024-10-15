Return-Path: <linux-rtc+bounces-2196-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B465F99E137
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B3F280D86
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3151C8773;
	Tue, 15 Oct 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwckEADR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132118BBA2;
	Tue, 15 Oct 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981368; cv=none; b=rB9bJaJ+qQ5crQdfpu6qtj4DPSuFtnHTRzdPBkT4LIDKdNc1ViXAmEBWgAzRBPpzBWNqJlKFLglQV0X0nz3B7LGSj+84EULgj9IwVzbtCUN0KlFw3j/t2ufD22jGmczW2U7X1kUzYg4PJPMDGIanG4CXzfMx8NjVmc3m6ewoY6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981368; c=relaxed/simple;
	bh=T9XLHbWuFkoXFRLF1LpDabJBHG+uY4lL1iioAODVpeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgHHP+Zd2fuFoWJsyvdctrPxkkwaocovoIf+n7FSlz1jy0Z0WApX7AGLGPa+rZzhzlc3SkLiIlCLdsgC6zegUyGZppk7ZhawtkhtgwWHp+lNopsYsw4j4ZYeIW1x51LkF95BS7juUO/LOMIQsD5W6xA6Vs4KVInw1Ptme9fgF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwckEADR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73612C4CEC7;
	Tue, 15 Oct 2024 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728981367;
	bh=T9XLHbWuFkoXFRLF1LpDabJBHG+uY4lL1iioAODVpeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwckEADR7kQEyu/o408HBXU9JixBJ82yK/t0kKJDbNX4kW4QkFDfe1PvM6UFFcoN+
	 iPRmubk6BJwYu1xijDIvMiBooky6KHqjPLsj7HpVM+kxqLL6xFvcGhJgj79P7vj0il
	 6NFbOjY7XIbn5GlqGmTmCBTmzOoStPl8tO7cBrR9nxsI7YyCQKtW2QOpg2CFFDlGQt
	 x80TJQnAr3SlKUqCJlpjOFW+v2lV5z9CPeuUbXReZ2pBAUhPe7uCB63kzPfz7vwKIU
	 gBOT8M3NfPXKQAtoHx6Cn4UhzQh2FCCnX6QMJZFGlmc72GAltH7xA3V8sSWu1bXuZ1
	 FaEeheYlhMq2w==
Date: Tue, 15 Oct 2024 09:36:03 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RFC PATCH v2 1/2] mfd: 88pm886: add the RTC cell
Message-ID: <20241015083603.GB8348@google.com>
References: <20241012193345.18594-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241012193345.18594-1-balejk@matfyz.cz>

On Sat, 12 Oct 2024, Karel Balej wrote:

> Add a MFD cell for the chip's real-time clock.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     RFC v2:
>     - Break out the register definitions and reword the commit message
>       accordingly.
>     - RFC v1: https://lore.kernel.org/r/20240920161518.32346-1-balejk@matfyz.cz/
> 
>  drivers/mfd/88pm886.c | 1 +
>  1 file changed, 1 insertion(+)

Looks fine.  Let me know when you're ready for me to take it.

> diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
> index dbe9efc027d2..891fdce5d8c1 100644
> --- a/drivers/mfd/88pm886.c
> +++ b/drivers/mfd/88pm886.c
> @@ -37,6 +37,7 @@ static struct resource pm886_onkey_resources[] = {
>  static struct mfd_cell pm886_devs[] = {
>  	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
>  	MFD_CELL_NAME("88pm886-regulator"),
> +	MFD_CELL_NAME("88pm886-rtc"),
>  };
>  
>  static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
> -- 
> 2.47.0
> 

-- 
Lee Jones [李琼斯]

