Return-Path: <linux-rtc+bounces-6678-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Zh6O/gPMWoMbAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6678-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 10:57:29 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81868D56A
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 10:57:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gaWOaeaX;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6678-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6678-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71560302BCD0
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jun 2026 08:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AE841B37D;
	Tue, 16 Jun 2026 08:57:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAF4219F2
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2026 08:57:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600242; cv=none; b=ltY/XpyLUv+rX4tYD0wtAS2GcMNaY7yb6nt2LI1VDlLzGLRPmM603mlmCJp9yW80TQIRD0P+Y73W7ozWMN6cW3ngwoCrSQ62uKuIeIaK90TRddqZRqmR3E0YKKfonQN1Tcs85fzqClwt12UnLy2Wk7mRWLutCfRnuxNK1QDhFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600242; c=relaxed/simple;
	bh=YQTPaERZZEVfDy3cbkgqveLx6aZM/khTCmkBnMIkHzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=au6r4Nu1owYnQAd0UUSLKtO0upJtw0JoUZDqHd9ygSZ7QsRnIunGYBuiLlKpkPUZ4uSgkLIDmIBdpUSdyR7tjGqdakwYlgCgQRsm1LFuFD0Dh0BpuhNjGh+T5YaE+rl4o7K38npMk/pRoEtbFsdwwHxVIuwDdrR0SRkF4Hfze5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaWOaeaX; arc=none smtp.client-ip=209.85.210.194
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-84237c55ef9so2710471b3a.0
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jun 2026 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781600239; x=1782205039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yNlL/Fch0KIwV+VLb90p7R9gZLFeyNye+IbISH5/PI=;
        b=gaWOaeaX2J1PXtTO6DYazCZuO/wZgABeqHvpIBsMR5ePCLQ75YYmnlyp45IBxQJhxc
         YHkMPmp09gvEZI+2o82ac6EGV8QbwOZiJfr1TdBYOY4Sn0VH/Aq61/p23GFA8n95v+ct
         GOdS6DvvMgk4ARkAdsfWgs/F+KWjaklm1EA/TYEb7WEkqPXNpBuMFI3TP3M0lsiTwBC5
         Kx4whI+HvNLhp07YmHSuNyOs9o9TodTO5Oj5V/ff9T0ngexfNXaIkhf4pHE4ZfcwbDzz
         LZYHrIpWTnPwGQ0gc0O4TDdK+GQwTFcK3zIR59TG8fSwGjsNJq/KZMOG0aZzd+s/8Wlh
         UMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600239; x=1782205039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yNlL/Fch0KIwV+VLb90p7R9gZLFeyNye+IbISH5/PI=;
        b=EYQPofxHXjN8apz72ZXS7Gx5PP6xWD1xuYWalXJIYORlsqf5eF8Ma2Tt9S7ctHn2aR
         pMoJb2z+zy/5KgacZJUNnvEuBVFnHzfYrVneiG7iRQ45SvmGOytY+4BT4nr227bn3M46
         oQaMXQI6akwMTp8bxuZQiYTJQpakIrwN0LnQ/6BoMh87x6+KtMH1Ae6CRT5000x6mz1A
         P1PmeWky32CpvT771ArKtxpx8167Agj+uO8JHU/OkBRsfJux+XSVokgjfsjCULvuwtGD
         FvI1LVVyTE3GB2GczbFxoRvxkcYeV/ayHeMOV+pUy6M1VWWwqX6iCO1Y9nlWSED3NUYi
         Iaxg==
X-Gm-Message-State: AOJu0Yys0hB5BLlGtdMTYem6+y2o0wyJlXD61YojdA2cnyIdVc7JcF+L
	bYxU0jOKTGy/bySKZ96BnwJS8CZOi2YSz8SG5vK+DVLhCwPnuH8LmKfH
X-Gm-Gg: Acq92OEF36/yCchjp0OGcpTCEx2P/UGFJJ7PA0fYOP6MHQZhwZArr0GQbOR1pf+AwsS
	ZXNaK9sxrGs7MIPUdIS+x5cm+y1j+LFPgU7EZjVxzgYFeXGRMYBi7KxkxsGZ2oBACPClaJOB5c4
	ugUHoZDsC/hgIqNuAmtks8+ER4hO8Bj1u2260Ei9gXZOq2s5aAlTtT0VGwFNlIieEeprzmKCuaK
	8FDub7X/ebRfFxdo023pkYge+i23PN49tPQL586MtVYoOLqrdbeaM8FqhoIQ+xE0RdM1Fbthszy
	Rq59O440NK4qgWWCaXaIARVLhTPMrOSGCGmvpkHQS5BGbgADL37GBGjsfLi0gJgteRzG2zTkU7m
	Ve8ENubj4d5V9w3hXcbwD+/s6ZXjhykGDPLfw8FuYjJtqDCUsy0IrU1z6CKvDxBb7ihFRHAS/cb
	KHBW8OMNnOHtddjz6MvaGN15OUuM9lSyJL74wFdfRRdV2dpL5nsjyk
X-Received: by 2002:a05:6a00:391d:b0:842:6482:adc with SMTP id d2e1a72fcca58-8434cd0ca2emr18698657b3a.9.1781600239218;
        Tue, 16 Jun 2026 01:57:19 -0700 (PDT)
Received: from Tejas-Legion-7-16IRX9.. ([103.159.249.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbc89sm12689662b3a.15.2026.06.16.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:57:18 -0700 (PDT)
From: Teja Sai Charan B <tejaasaye@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Date: Tue, 16 Jun 2026 14:26:58 +0530
Message-ID: <20260616085659.12809-1-tejaasaye@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6678-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tejaasaye@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tejaasaye@gmail.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tejaasaye@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E81868D56A

From: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

Convert the rtc-cmos devicetree bindings to dt schema.

Signed-off-by: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

---

Changes in v2:
- Allow intel,ce4100-rtc compatible used by existing DTS files
---
 .../devicetree/bindings/rtc/rtc-cmos.txt      | 27 ---------
 .../devicetree/bindings/rtc/rtc-cmos.yaml     | 60 +++++++++++++++++++
 result.txt                                    | 17 ++++++
 3 files changed, 77 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
 create mode 100644 result.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt b/Documenta=
tion/devicetree/bindings/rtc/rtc-cmos.txt
deleted file mode 100644
index 7d7b5f6bda65..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-cmos.txt
+++ /dev/null
@@ -1,27 +0,0 @@
- Motorola mc146818 compatible RTC
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Required properties:
-  - compatible : "motorola,mc146818"
-  - reg : should contain registers location and length.
-
-Optional properties:
-  - interrupts : should contain interrupt.
-  - ctrl-reg : Contains the initial value of the control register also
-    called "Register B".
-  - freq-reg : Contains the initial value of the frequency register also
-    called "Register A".
-
-"Register A" and "B" are usually initialized by the firmware (BIOS for
-instance). If this is not done, it can be performed by the driver.
-
-ISA Example:
-
-	rtc@70 {
-	         compatible =3D "motorola,mc146818";
-	         interrupts =3D <8 3>;
-	         interrupt-parent =3D <&ioapic1>;
-	         ctrl-reg =3D <2>;
-	         freq-reg =3D <0x26>;
-	         reg =3D <1 0x70 2>;
-	 };
diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Document=
ation/devicetree/bindings/rtc/rtc-cmos.yaml
new file mode 100644
index 000000000000..ba4812778115
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/rtc-cmos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola mc146818 compatible RTC
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: motorola,mc146818
+
+      - items:
+          - const: intel,ce4100-rtc
+          - const: motorola,mc146818
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ctrl-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the control register
+      (also known as Register B).
+
+  freq-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Initial value of the frequency register
+      (also known as Register A).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells =3D <2>;
+        #size-cells =3D <1>;
+
+        rtc@70 {
+            compatible =3D "motorola,mc146818";
+            reg =3D <1 0x70 2>;
+
+            interrupts =3D <8 3>;
+
+            ctrl-reg =3D <2>;
+            freq-reg =3D <0x26>;
+        };
+    };
diff --git a/result.txt b/result.txt
new file mode 100644
index 000000000000..5e90660b93ec
--- /dev/null
+++ b/result.txt
@@ -0,0 +1,17 @@
+arch/x86/kernel/x86_init.c:42:	{ .compatible =3D "motorola,mc146818" },
+arch/x86/platform/ce4100/falconfalls.dts:420:					compatible =3D "intel,ce=
4100-rtc", "motorola,mc146818";
+arch/mips/boot/dts/loongson/rs780e-pch.dtsi:31:				compatible =3D "motorol=
a,mc146818";
+arch/mips/boot/dts/mti/malta.dts:110:			compatible =3D "motorola,mc146818";
+arch/alpha/kernel/rtc.c:25: * We don't want to use the rtc-cmos driver, be=
cause we don't want to support
+drivers/built-in.a:1031:rtc/rtc-cmos.o/
+drivers/rtc/built-in.a:11:rtc-cmos.o/
+drivers/rtc/.rtc-mc146818-lib.o.cmd:1:savedcmd_drivers/rtc/rtc-mc146818-li=
b.o :=3D gcc -Wp,-MMD,drivers/rtc/.rtc-mc146818-lib.o.d -nostdinc -I./arch/=
x86/include -I./arch/x86/include/generated -I./include -I./include -I./arch=
/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./=
include/generated/uapi -include ./include/linux/compiler-version.h -include=
 ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KE=
RNEL__ -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno=
-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a=
 -fcf-protection=3Dnone -m64 -falign-jumps=3D1 -falign-loops=3D1 -mno-80387=
 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-setup -march=
=3Dx86-64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -mstack-protecto=
r-guard-reg=3Dgs -mstack-protector-guard-symbol=3D__ref_stack_chk_guard -Wn=
o-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-ex=
tern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-retu=
rn=3Dthunk-extern -fno-jump-tables -mharden-sls=3Dall -fpatchable-function-=
entry=3D16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-rac=
es -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-c=
alls -ftrivial-auto-var-init=3Dzero -fno-stack-clash-protection -fzero-call=
-used-regs=3Dused-gpr -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -falig=
n-functions=3D16 -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overf=
low -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wu=
ndef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wframe-larger-than=3D1024 -Wno-main -Wno-dangling-po=
inter -Wvla-larger-than=3D1 -Wno-pointer-sign -Wcast-function-type -Wno-arr=
ay-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fal=
lthrough=3D5 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variabl=
e -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -=
Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-miss=
ing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-mayb=
e-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5  -fsan=
itize=3Dbounds-strict -fsanitize=3Dshift -fsanitize=3Dbool -fsanitize=3Denu=
m      -DKBUILD_MODFILE=3D'"drivers/rtc/rtc-mc146818-lib"' -DKBUILD_BASENAM=
E=3D'"rtc_mc146818_lib"' -DKBUILD_MODNAME=3D'"rtc_mc146818_lib"' -D__KBUILD=
_MODNAME=3Drtc_mc146818_lib -c -o drivers/rtc/rtc-mc146818-lib.o drivers/rt=
c/rtc-mc146818-lib.c=20=20
+drivers/rtc/.built-in.a.cmd:1:savedcmd_drivers/rtc/built-in.a :=3D rm -f d=
rivers/rtc/built-in.a;  printf "drivers/rtc/%s " lib.o class.o interface.o =
nvmem.o dev.o proc.o sysfs.o rtc-mc146818-lib.o rtc-cmos.o | xargs ar cDPrS=
T drivers/rtc/built-in.a
+drivers/rtc/Kconfig:1065:	  will be called rtc-cmos.
+drivers/rtc/Makefile:45:obj-$(CONFIG_RTC_DRV_CMOS)	+=3D rtc-cmos.o
+drivers/rtc/.rtc-cmos.o.cmd:1:savedcmd_drivers/rtc/rtc-cmos.o :=3D gcc -Wp=
,-MMD,drivers/rtc/.rtc-cmos.o.d -nostdinc -I./arch/x86/include -I./arch/x86=
/include/generated -I./include -I./include -I./arch/x86/include/uapi -I./ar=
ch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -=
include ./include/linux/compiler-version.h -include ./include/linux/kconfig=
.h -include ./include/linux/compiler_types.h -D__KERNEL__ -std=3Dgnu11 -fsh=
ort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-ss=
e -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a -fcf-protection=3Dnone =
-m64 -falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpr=
eferred-stack-boundary=3D3 -mskip-rax-setup -march=3Dx86-64 -mtune=3Dgeneri=
c -mno-red-zone -mcmodel=3Dkernel -mstack-protector-guard-reg=3Dgs -mstack-=
protector-guard-symbol=3D__ref_stack_chk_guard -Wno-sign-compare -fno-async=
hronous-unwind-tables -mindirect-branch=3Dthunk-extern -mindirect-branch-re=
gister -mindirect-branch-cs-prefix -mfunction-return=3Dthunk-extern -fno-ju=
mp-tables -mharden-sls=3Dall -fpatchable-function-entry=3D16,16 -fno-delete=
-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-stro=
ng -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-i=
nit=3Dzero -fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -pg=
 -mrecord-mcount -mfentry -DCC_USING_FENTRY -falign-functions=3D16 -fstrict=
-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fco=
nserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3D=
strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -W=
no-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wf=
rame-larger-than=3D1024 -Wno-main -Wno-dangling-pointer -Wvla-larger-than=
=3D1 -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop=
-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=3D=
date-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -W=
enum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-var=
iable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -=
Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers =
-Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-si=
gn-compare -Wno-unused-parameter -g -gdwarf-5  -fsanitize=3Dbounds-strict -=
fsanitize=3Dshift -fsanitize=3Dbool -fsanitize=3Denum      -DKBUILD_MODFILE=
=3D'"drivers/rtc/rtc-cmos"' -DKBUILD_BASENAME=3D'"rtc_cmos"' -DKBUILD_MODNA=
ME=3D'"rtc_cmos"' -D__KBUILD_MODNAME=3Drtc_cmos -c -o drivers/rtc/rtc-cmos.=
o drivers/rtc/rtc-cmos.c=20=20
+drivers/rtc/.rtc-cmos.o.cmd:3:source_drivers/rtc/rtc-cmos.o :=3D drivers/r=
tc/rtc-cmos.c
+drivers/rtc/.rtc-cmos.o.cmd:5:deps_drivers/rtc/rtc-cmos.o :=3D \
+drivers/rtc/.rtc-cmos.o.cmd:1372:drivers/rtc/rtc-cmos.o: $(deps_drivers/rt=
c/rtc-cmos.o)
+drivers/rtc/.rtc-cmos.o.cmd:1374:$(deps_drivers/rtc/rtc-cmos.o):
+drivers/rtc/rtc-cmos.c:1382:		.compatible =3D "motorola,mc146818",
--=20
2.43.0


