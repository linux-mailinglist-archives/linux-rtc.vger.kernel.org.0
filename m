Return-Path: <linux-rtc+bounces-4052-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D4AAD25D
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 02:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC70D1BC5560
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 00:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FA12AE84;
	Wed,  7 May 2025 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6JVN0M0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF4D1E871;
	Wed,  7 May 2025 00:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578494; cv=none; b=DgnE6jlYL/SMWJtsQv6v3mIUOfI3m2tZOr3GEByXulUbUZv7icknxMC2aalIETeXPRk5bMsS5UAnUOvmmxnZ2WusNSPL7fw0EUC/M65wO3BDvK9nULdexRnnTvFGcnDy0OSXp73swa0umfVSAJeyDIoZ5z1h8PBy2awijSNieWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578494; c=relaxed/simple;
	bh=548Ai+V2mwoJ45UgqwGrbboTIZXoY4ulmIfeHhWTZvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzaAoIsRL9RKY/CVKcDHwNHxTt5LR6Z1t0VbZohrIvhlv95PL70jZgdZep8lPJY7PsfXmeohxtQ2nFtqTnw1P668PfhUWQow2n0kNNCykKRfs9seUdTroI63SNqius6BoOGk5C6XtA82jdHJgfGFJpIS1vROVm1eDUM0QSoubx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6JVN0M0; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47662449055so41208781cf.1;
        Tue, 06 May 2025 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746578492; x=1747183292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs0cbHUy/X1CPc3qXeHo09wKGdN2bsQRYveDoPtibro=;
        b=h6JVN0M0M+hIUzdKDImj+X5kMDoo7ZuqiXLshVzilVDYu3Aqm9VH35eo7LeILzlkvM
         cGdy3p6BEP+5OsSzoWY5J2jk3yO5+6XXVjwYyxnS3N0gxG9irELiCSHPx8a7h9HdpmH6
         t/xX+o+PhzUFYsEC7uBEemt3JGtA1ksYi+G8QQipbqxzTZZesKkcNS7MnuaGqhWXkDKs
         nvHFBV98zjVzsAdXw+9dEATMUghhbcGko2fiuvg6jDsNnAUOKUF9fFjXAbPRBzPXgvml
         h5BNyZr1cxPfQ0oCFGwzQYKoIT2I6WEzCxdV0a1m2r6VCCIHkRwpeXDc9nqYAnqvYAmC
         VH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746578492; x=1747183292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs0cbHUy/X1CPc3qXeHo09wKGdN2bsQRYveDoPtibro=;
        b=gAMDq7Vjt6Y7/kc7oONbCIBEI17HGLY5HZOg7RS6BQZXpETDYngF770WI4mOf/uXRy
         2LcZsXaV61k7NUx3bJIN0DVFXG3p5xKfh4V3TYgpFH7D5H6WQxZUhr0w3SxznEURlyOA
         pCZkY7ypzRtvPrNKcjqkFHCU+8hfdD3wCfGGA0sSHEDGISzcfjjXaW6HsXNUA50CQ11f
         dZtI58iNC/ULAtTEq58/emN4zGPy7Ld4ka6G129WjtFV0qASWNOq+4oCwubcS2XsNunK
         Tl33HH45sYq4cRAePgGLzKTl0u5oiNrXuEjJpI0tip2rw0z4Z0jgXkJvp6u1W0gg9oS6
         RP3w==
X-Forwarded-Encrypted: i=1; AJvYcCUNd5NtzGZ0PMkIcOrU23ePoHvSYbZmHuGYlps/mH/SzUHWoEthQhAnanooh/PFth8j8I8xrzG2nLk2vLgL@vger.kernel.org, AJvYcCVLxxp4XdUT6AR1ulZIdtCXtehwaB7k57PEmwmUXQB7GfUxoY5Fvbyg2GbgCtjlV8O5i9AbXMauqsdO@vger.kernel.org, AJvYcCXGEP/C1eznrmp/P2h3zDMqdMPSk/ZKFamqxvCmlmVG3xa3UsOeiFLyaIDBj+poF7YRmiv043okgdaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0bHV52Rfb+O5RkU9G5R+XPpwhi87X2/DP+pbeOn+P/Q6YdU90
	e5JQrWMy+z5m+8yKhhfG+/GYFnbKnKoo2OoBd87SYOcdrx2jAuZH
X-Gm-Gg: ASbGnctfdoGicR8pKGcN/okEvTCqU8rQA0lJckKutghe0sEMDdzwxqhpL4VfYrqGnAh
	d1195AXCy60wc+5mrcSv01sIlcxeYGa3zDyWZBcktwGB4JVBzBa9ymFLjWlpxm5kDrpAg+Ph+wu
	Ip3XOrKRMthghS0kX368msfI/6AsMvR2lMCNau/ZtLa7BKhe3DJ6gLYxdbKvBiV8KXbQtINAL1T
	RpBJ8w/XOWHezTAUIqIxt6Scnh67RIoGyeoTHpOyEptK8TWlyob9IttAogvhy8JleJHdWaVV8ZB
	hQ2GLF45tEzci7cV
X-Google-Smtp-Source: AGHT+IGVZ/pnRC0a6W8UhFRw6PLxdQ3rmQAvSYapKUv6I9ZAERpmmy7XYBPDgVEEHyeyj6Svq20t2w==
X-Received: by 2002:a05:6214:5285:b0:6f4:c237:9709 with SMTP id 6a1803df08f44-6f542a4f69amr20264566d6.25.1746578491730;
        Tue, 06 May 2025 17:41:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f5427813f7sm4965586d6.71.2025.05.06.17.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:41:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v14 0/3] rtc: sophgo: add rtc support for CV1800
Date: Wed,  7 May 2025 08:41:05 +0800
Message-ID: <174657845776.270439.14182272430991202072.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 15 Mar 2025 23:49:11 +0100, Alexander Sverdlin wrote:
> Real Time Clock (RTC) is an independently powered module within the chip,
> which includes a 32KHz oscillator and a Power On Reset/POR submodule. It
> can be used for time display and timed alarm generation.
> 
> This series aims to provide complete DT bindings, but the drivers are only
> focusing on RTC implementation. Possible Power Management and remoteproc
> can be implemented later (hence the RTC driver is using syscon, because
> MMIO space is really interleaved among different functions).
> 
> [...]

Applied to soc-for-next, thanks!

[1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
      https://github.com/sophgo/linux/commit/76517429dbfd8eca16fe85482cdb8024bbbd06bd
[2/3] soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)
      https://github.com/sophgo/linux/commit/c8754c7deab4cbfa947fa2d656cbaf83771828ef

Thanks,
Inochi


