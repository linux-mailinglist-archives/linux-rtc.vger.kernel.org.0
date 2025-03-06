Return-Path: <linux-rtc+bounces-3417-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6AA545FD
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 10:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A8DC7A2534
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 09:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B495A2080E8;
	Thu,  6 Mar 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muKwXhUH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE152080C5
	for <linux-rtc@vger.kernel.org>; Thu,  6 Mar 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741252357; cv=none; b=cXOxqj6maW8kCqm5fppNoP2hwC78leTU2nPTVViRw4Ha1vrKi1w+ot+4AisVAw7jy1VhGXyVjcVoQH3aC3BiXn4sjcNhkz/G6bq4Eb3W1QpeBDrGUxcVEF3kjhBsqCNfju15ozaFvyeHop3oWFdlW0IeJRvyZowOr0ShZ+8zTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741252357; c=relaxed/simple;
	bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7XFwEB6TaQ8AH6x9zY3t3XbbgSAv31gS7tn9TOqna3M1U5KdkMBs4LgMubR6m8zEwdJEySPeE4JJbugq/9b3qPc2If1YNqmDaXaQiWs/sOrFoGloclf/Vj5EdMO0FNk30gLoTRREHmXRSquSVL5Tu3LaJc9hstO3Czu9WykNWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muKwXhUH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30b83290b7bso5014271fa.1
        for <linux-rtc@vger.kernel.org>; Thu, 06 Mar 2025 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741252354; x=1741857154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=;
        b=muKwXhUHzOOGfyheW/y2AMH2JSDH155PgxsNHIAFFK+1mP/Rcrn7r2y1Bj2QyFc3Fa
         ePoMcQWYCrTMGDtulRTk8BzAeyKinZI0a66Cq4woa0BW+JIZw4tDEQlQUxzKCRHrwyLG
         I0iQenQwxl6Ly8Bf9PK3nXHCpkZSdnb4RArmcmQsM6e90yjFkuzHspWiMfzcffmiOitY
         jrbeyXyTlq+1SEl2E8B6ELOgshiSy4wWA0vMM8PxI4is4DpNs+LFdWbSkJGxzluyTYRA
         LP005WtIz3ILy0yvdgg6nQjywUk+eTh30EwP11pY6SYMXER0L0hsfOfP/3Ln06BrHISD
         T6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741252354; x=1741857154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqmM445nk83WSKAnQchwc4aFd3IVUazkzTOEDmZ6Zms=;
        b=upSktfZtYNkZVPms7bwFDuBfmMGutAZ5lppw3ll8uLX8YH4TWdx36ri9cTg7Mkzcau
         mrcfymdPQiJYIQx4gBZcODcv4iM/Q/9QE7YOJLIxMDD+8dgNPsjwIOOythLY7Hq1gvCZ
         FRz6lKMjQREtFYAl/QRYWf5uAh4Mfiv+Hf3JeW+5SpBqfTvfokEZ8S85uDm9RGIVk2TL
         PFnksdoUKTkgEmLeb5C4BRQRZoILMvLhMU1AfH7ualvqxHME4YJXfQ9s9T5NCbNijjOm
         DQbl025kRjJXhSuYuOamrobavsxBG2unNlUVkbwRcnW4Wokxqon7WJBkaBNCupHV5+UH
         R3RA==
X-Forwarded-Encrypted: i=1; AJvYcCX7cIaQ0aLnqRMF5Z0IJTphII47XHxUy8tejVMR1JMq4gHsaC8+9b/WMBAnsjgg2WB+BIWIggHx+5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ0wstZPGZKcjqqJT4rSf67ZsOziD/RBm3lN3c0/GA18wPUnU9
	tqoGErtVp+FdBzTOF4jOMtQ3zzXYnV7Sy2TPIHiazQrGW2+TPWjV+dSe85xuGNity1q10ou/Ah3
	r3mhqiurwUKF/WqkcoJ1y7Zx9J0QkZK/li+JxxVZ61Y1tlKQS
X-Gm-Gg: ASbGncv80WHdneElnyxFjJnUlnlg3zP074IMv3q5gRxoCuzHMIe6HIhuu2dxD7rT4Jf
	VYkbko3aXAP7/mQ3Wgt7PeluHM8SPRZ7ZFt1Xx/+TH5s8S2GI3yCJ+JCIDkVOMXwuzk4flPTGMI
	628yf4UYOyJ2yIH2Lro+pPLfQbgg==
X-Google-Smtp-Source: AGHT+IHJbjr7n6MNFdoyJ5OcRjeliVrB+L/QnglEfbXH7bLR2SWadB2qjeLyT4uRMCDJc2UAADFOOmMVPfRkheSpHCU=
X-Received: by 2002:a2e:b8c9:0:b0:308:efa4:d277 with SMTP id
 38308e7fff4ca-30bd7a507f6mr21783241fa.15.1741252353675; Thu, 06 Mar 2025
 01:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Mar 2025 10:12:22 +0100
X-Gm-Features: AQ5f1JqQwmuBLuVbVlZaXchGO6-cZ55N78DkfVd4KCTXsG2vg1w72ORT3ZwrFbs
Message-ID: <CACRpkdZKbEXEabB+4uYvbBRXfFR_Jk-hHVtrZYD+cpKXgcMsnA@mail.gmail.com>
Subject: Re: [PATCH] rtc: pl031: document struct pl031_vendor_data members
To: alexandre.belloni@bootlin.com
Cc: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:17=E2=80=AFPM <alexandre.belloni@bootlin.com> wro=
te:

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Document the range related members of struct pl031_vendor_data.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503011015.SYvdddTc-lkp@i=
ntel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

