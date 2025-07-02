Return-Path: <linux-rtc+bounces-4420-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B3AF642F
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 23:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A961C45C28
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 21:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029112F6FA6;
	Wed,  2 Jul 2025 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FcOuPtH7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18382F5C4C
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492237; cv=none; b=TcO3+QM9ExlhoiqumMjNdGdsn1FGn5ML14Xl+NQ7cB99UZrLEtyo2+oiqlZm9UvrTa00pfwek5z03pZHX4lQ8l+fEbbAN4de3ZpIjTVP31xzkZsjgIjnTdNGtgy0yc3oqcOlMSxrpzUGyNAQB0CT+3gfI4Biskc6nFcUfvL/q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492237; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7iNIHOldHYvmC8tzqJTunZGw4z6iS13IvNr+9kT/PPtg3mUPNVocHAMU8A9dssjLdcQM60pvnYkPofARUwILiSKpSMmSXCBjyorX4sXuCgdsbIMpWwK9i25/xvsz+LZEwWrPVmPrMdzjnpOpgikEwmHct2aX2h9hPmspivKtI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FcOuPtH7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fa980d05a8so78725826d6.2
        for <linux-rtc@vger.kernel.org>; Wed, 02 Jul 2025 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492235; x=1752097035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=FcOuPtH79xxKK+ahU0IgIjk6Bzh208ghRpWs1IUCv0qPA3Gb2FmuyIyWcFYe9O45Cc
         /rJQA+zRE5jIcp5CrZlW3IoK+ICfaZCMWKm6QSOfWU1+EFrs/w7K84EP+6R8KEsAMSsF
         /pSNEKytB7NO4snwxvaaz7niw9jCnPhTYxtT8fIlKBWcDawmI3M9UBMDAJD0bnZmfWpj
         tD2E4vuLWG8WznkYPS8RP2QQzAhLxeD64Rz+aXDHe2Bvb1czHatqkVg3wLRu0mufd5GP
         /xK05tECyE76vVUHRgUT0uD/+PtWXdAfOenKTU+CfUF3EJgQrGYyEQkU9eS0mCH35F5r
         H+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492235; x=1752097035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=C8NOsXmhfUQNBbjyi3+iZcfGrwHBKO65GTGeEdNmKBSY2GVOi0Yxlx6SffQ5j11Fsg
         J9h4Ll1bd4ryCP1+naRk1A7TtmY7aB5P55nRE3jx01omFMF4qdfDJ0TfH4VVms0Lzg4s
         xcEfklcAPKaJN0NBK8d1lrIrqoA+KqIZBc6TVUWvP3ZJaoV5OhIlsesT/crfXTZISBd5
         4VuFnWsbH5Op67xJwHqogdrPvj39ye/Dt8QJ6a7wXSsrOvpQ5gxE9f+rlVeWLnL6DRYa
         Dl/ExCUk67kah45wWXOUGwXzNmg+uL32kdt3zlE63f+FBI7Kf3jO0caz/j/Q0nhA1Mg/
         7Row==
X-Forwarded-Encrypted: i=1; AJvYcCXP7XlEqsWcIlOtQtiQr3acp287sBpxJ4tyDkqfXSzZghlA56BvLErtbHwjjiuKK0rwDh72H24w6As=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlz66NyLaEYv3OWY8IlSTiedKihjLv5Sbcc9uMm7l546H1Qo6y
	rmT5wzqTTAivGz5pK4dGScJtgYHanY5daUwPKRZhpfyQLmHfNIgacVGnmHiwbRRo3gw=
X-Gm-Gg: ASbGncseAWuOE5EFodS0A/i6dkZrpXpAd61+24xQH8LgQcGf1/pipLRqRk7p0BX09S1
	RlCmEcTck7O+txp9iIx3wef2Ob21gQCaFKIAVetYUWsw9GKIhhd+UJHOPFFurM+UjevBj/SmdnH
	V7zg8Js+/0ARDRlUTfYW4CCl76kzR2OuB5lBlV1c0adPi8I+MCxRC8IayefVqsNG5K9MVo/+Yqw
	+vYP07JP/G7RUeEfbEhB29ilY6MTOd3ivwPPdphMUcERa4ID6Ph3Ijz4+MUtDe69GNxNF/f9/Lf
	9fiESdIpMbDsn6cunUUo1AWHu7jIfcnIkE9Dw++GciVbZacsmGiFx/emginXpDHCW5pPak3Uk54
	PuoNqrxcHVU/8mG7N4VJAv76o2A3kN36J4Z0=
X-Google-Smtp-Source: AGHT+IHmuE1Hb+fdqWuuRSoeZlf3aoCIg4RErjvlQJxeD9KbYWIor15tIIiabP6Dq/CTktn4FVDAFA==
X-Received: by 2002:a05:6214:c28:b0:6fb:4b54:ebb with SMTP id 6a1803df08f44-702bcbf5777mr14378456d6.14.1751492234758;
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/8] riscv: dts: spacemit: define fixed regulators
Date: Wed,  2 Jul 2025 16:36:56 -0500
Message-ID: <20250702213658.545163-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


